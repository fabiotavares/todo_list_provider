// provedor de autenticação
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/navigator/todo_list_navigator.dart';

import 'package:todo_list_provider/app/services/user/user_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserService userService,
  })  : _firebaseAuth = firebaseAuth,
        _userService = userService;

  Future<void> logout() => _userService.logout();

  User? get user => _firebaseAuth.currentUser;

  void loadListener() {
    // startado ao iniciar o app, para ficar escutando o firebase
    _firebaseAuth.userChanges().listen((_) => notifyListeners());
    _firebaseAuth.idTokenChanges().listen((user) {
      // será chamado sempre que houver login ou logout
      if (user != null) {
        // realizado login; navegue pra home page
        TodoListNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        // realizado logout: navegue pra login page
        TodoListNavigator.to.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}
