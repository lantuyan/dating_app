import 'package:firebase_auth/firebase_auth.dart';

import '../../../blocs/database/database_service.dart';
import '../../../di/auth/authentication_service.dart';
import '../../../blocs/authentication/bloc/user_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationService service = AuthenticationService();
  DatabaseService dbService = DatabaseService();

  @override
  Stream<UserModel> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return service.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) {
    return dbService.retrieveUserName(user);
  }
}

abstract class AuthenticationRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<void> signOut();
  Future<String?> retrieveUserName(UserModel user);
}