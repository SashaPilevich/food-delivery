part of 'auth_data_provider.dart';

class AuthDataProviderImpl implements AuthDataProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firebaseFirestore;

  AuthDataProviderImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await saveUser(
      uid: credential.user!.uid,
      email: credential.user!.email,
      userName: userName,
    );

    final UserEntity userEntity = await getUser(
      uid: credential.user!.uid,
    );
    return userEntity;
  }

  @override
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserEntity userEntity = await getUser(
      uid: credential.user!.uid,
    );
    return userEntity;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    await saveUser(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email,
      userName: userCredential.user!.displayName,
    );
    final UserEntity userEntity = await getUser(
      uid: userCredential.user!.uid,
    );
    return userEntity;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> saveUser({
    required String uid,
    required String? email,
    required String? userName,
  }) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
        _firebaseFirestore.collection('users').doc(
              uid,
            );
    final Map<String, String?> userData = {
      'uid': uid,
      'email': email,
      'name': userName,
    };
    if (!(await userDataFirebase.get()).exists) {
      userDataFirebase.set(userData);
    }
  }

  @override
  Future<UserEntity> getUser({
    required String uid,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _firebaseFirestore.collection('users').doc(uid).get();
    final Map<String, dynamic>? userData = userDoc.data();
    final UserEntity userEntity = UserEntity(
      uid: uid,
      email: userData?['email'] ?? '',
      userName: userData?['name'] ?? '',
    );
    return userEntity;
  }
}
