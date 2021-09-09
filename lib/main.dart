import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/app_module.dart';

Future<void> main() async {
  // duas linhas seguintes são necessárias para o uso do plugin do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppModule());
}
