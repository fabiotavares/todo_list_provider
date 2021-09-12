import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            Provider(
              create: (_) => Object(), // fake (pra não ficar vazio e com erro)
            ),
          ],
          routers: {
            '/home': (_) => HomePage(),
          },
        );
}
