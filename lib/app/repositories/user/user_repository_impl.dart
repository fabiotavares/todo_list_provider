import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';

import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      // imrpimindo o erro
      print(e);
      print(s);
      // tratamento de erro
      if (e.code == 'email-already-in-use') {
        // verificando o tipo de uso que já existe
        final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthException(message: 'E-mail já utilizado, favor escolher outro');
        } else {
          throw AuthException(message: 'Seu cadastro foi realizado pelo Google! Por favor, utilize ele para entrar');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }
}
