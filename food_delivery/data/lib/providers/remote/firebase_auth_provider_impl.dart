import 'package:core/core.dart';
import 'package:data/data.dart';

class FirebaseAuthProviderImpl implements FirebaseAuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const FirebaseAuthProviderImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
        _hiveProvider = hiveProvider;

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

    await _firebaseFirestoreDataProvider.saveUser(
      uid: credential.user?.uid ?? '',
      email: credential.user?.email ?? '',
      userName: userName,
    );

    final UserEntity userEntity = await _firebaseFirestoreDataProvider.getUser(
      uid: credential.user?.uid ?? '',
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
    final UserEntity userEntity = await _firebaseFirestoreDataProvider.getUser(
      uid: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await _hiveProvider.deleteUserFromLocal();
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

    await _firebaseFirestoreDataProvider.saveUser(
      uid: userCredential.user?.uid ?? '',
      email: userCredential.user?.email ?? '',
      userName: userCredential.user?.displayName ?? '',
    );
    final UserEntity userEntity = await _firebaseFirestoreDataProvider.getUser(
      uid: userCredential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
