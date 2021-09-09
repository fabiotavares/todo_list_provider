import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/modules/auth/auth_module.dart';
import 'package:todo_list_provider/app/modules/splash/splash_page.dart';

import 'core/database/sqlite_adm_connection.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    // adiciona um observador para controlar o status da conecção do banco de dados
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    // remove o observador previamente ativado
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List provider',
      initialRoute: '/login',
      routes: {
        ...AuthModule().routers,
      },
      home: SplashPage(),
    );
  }
}