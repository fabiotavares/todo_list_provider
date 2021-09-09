import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

import 'app_widget.dart';

// tudo que será compartilhado pela aplicação ficará aqui

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SqliteConnectionFactory(),
          lazy: false,
        )
      ],
      child: AppWidget(),
    );
  }
}
