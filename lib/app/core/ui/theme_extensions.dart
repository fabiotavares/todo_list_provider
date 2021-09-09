import 'package:flutter/material.dart';

// uma extensão para facilitar o acesso ao Theme.of(context)
extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get buttonColor => Theme.of(this).buttonColor;
  TextTheme get textTheme => Theme.of(this).textTheme;

  // criando um customizado
  TextStyle get titleStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
}
