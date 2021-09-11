import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    // context.read<RegisterController>().removeListener(() {});
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // é aqui que irei receber o resultado do registro
    // ficar escutando o erro ou sucesso da controller
    // final controller = context.read<RegisterController>();
    // controller.addListener(() {
    //   var success = controller.success;
    //   var error = controller.error;

    //   if (success) {
    //     // volta pra tela de login (também poderia ir direto para a home)
    //     Navigator.of(context).pop();
    //   } else if (error != null && error.isNotEmpty) {
    //     // mostra mensagem de erro
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(error),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // });

    // após criação da minha estrutura fica mais simples, assim:
    final defaultListener = DefaultListenerNotifier(changeNotifier: context.read<RegisterController>());
    defaultListener.listener(
      context: context,
      successVoidCallback: (notifier, listenerInstance) {
        // o que fazer se deu sucesso:
        listenerInstance.dispose();
        Navigator.of(context).pop();
      },
      // atributo opcional:
      // errorCallback: (notifier, listenerInstance) {
      //   print('Deu ruim');
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // sem voltar padrão
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(
                fontSize: 10,
                color: context.primaryColor,
              ),
            ),
            Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 15,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: ClipOval(
            // deixa tudo oval
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .5,
            child: FittedBox(
              // permite o filho adaptar seu tamanho à tela
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TodoListField(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TodoListField(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha obrigatória'),
                        Validatorless.min(6, 'Senha deve ter pelo menos 6 caracteres'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TodoListField(
                    label: 'Confirma Senha',
                    controller: _confirmPasswordEC,
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirma Senha obrigatória'),
                        Validatorless.compare(_passwordEC, 'Senha diferente de Confirma Senha'),
                        // como extender as validações com possibilidades personalizadas
                        // Validators.compare(passwordEC, 'Senha diferente de Confirma Senha'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        final formValid = _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final email = _emailEC.text;
                          final password = _passwordEC.text;
                          context.read<RegisterController>().registerUser(email, password);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
