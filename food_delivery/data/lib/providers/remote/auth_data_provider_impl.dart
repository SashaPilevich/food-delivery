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
  Stream<UserEntity?> get user {
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return UserEntity.fromFirebaseAuthUser(firebaseUser);
    });
  }

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
      imageUrl:'',
    );

    return UserEntity.fromFirebaseAuthUser(credential.user!);
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

    return UserEntity.fromFirebaseAuthUser(credential.user!);
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
      imageUrl: userCredential.user!.photoURL,
    );
    return UserEntity.fromGoogleAuthUser(userCredential);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> saveUser(
      {required String uid,
      required String? email,
      required String? userName,
      required String? imageUrl}) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
        _firebaseFirestore.collection('users').doc(
              uid,
            );
    final Map<String, String?> userData = {
      'uid': uid,
      'email': email,
      'name': userName,
      'imageUrl': imageUrl,
    };
    if (!(await userDataFirebase.get()).exists) {
      userDataFirebase.set(userData);
    }
  }
}
