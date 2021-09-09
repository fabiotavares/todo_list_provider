import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // widget usando qdo preciso saber tamanho de tela
        body: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          // mais simples que um container e tem as constraints
          child: ConstrainedBox(
            // definindo o tamanho mínimo da tela construída como sendo o máximo da tela do dispositivo
            // assim, não terei problemas se a tela construída ultrapassar a tela do dispositivo
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            // IntrinsicHeight força seus filhos a terem o tamanho que precisam ter
            // isso evita problemas com o Column que, por padrão, tem tamanho infinito
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  TodoListLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          TodoListField(label: 'E-mail'),
                          SizedBox(height: 20),
                          TodoListField(
                            label: 'Senha',
                            obscureText: true,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text('Esqueceu sua senha?'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('Login'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF0F3F7),
                        border: Border(
                          top: BorderSide(
                            width: 2,
                            color: Colors.grey.withAlpha(50),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          SignInButton(
                            Buttons.Google,
                            onPressed: () {},
                            text: 'Continue com o Google',
                            padding: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Não tem conta?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/register');
                                },
                                child: Text('Cadastre-se'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
