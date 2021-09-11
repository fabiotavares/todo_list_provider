import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';

import 'login/login_page.dart';
import 'register/register_controller.dart';
import 'register/register_page.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(userService: context.read()),
            )
          ],
          routers: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        );
}
