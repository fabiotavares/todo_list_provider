import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;

  TodoListField({
    Key? key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
  })  :
        // garantindo que, se o obscureText for true, o suffixIconButton seja nulo
        // pois não posso ter os dois ao mesmo tempo, onde meu ícone eye fica inutilizado
        assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado junto com suffixIconButton',
        ),
        // usando o ValueNotifier padrão para atualizar a tela (não gostei)
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon: suffixIconButton ??
                (obscureText
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextVN.value;
                        },
                        icon: Icon(
                          obscureTextValue ? TodoListIcons.eye : TodoListIcons.eye_slash,
                          size: 15,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
          focusNode: focusNode,
        );
      },
    );
  }
}
