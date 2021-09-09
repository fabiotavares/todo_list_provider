import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        Text(
          'Todo List',
          // normalmente faria assim:
          // style: Theme.of(context).textTheme.headline6,
          // mas para facilitar, vamos criar uma extensão para a classe BuildContext
          // em core/ui e usar o objeto context aqui existente para acessar
          // esses novos recursos (atalhos) definidos (bem legal isso)
          style: context.textTheme.headline6,
        ),
      ],
    );
  }
}
