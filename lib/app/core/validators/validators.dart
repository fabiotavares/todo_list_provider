import 'package:flutter/material.dart';

class Validators {
  // para evitar instanciar essa classe
  Validators._();

  static FormFieldValidator compare(TextEditingController? valueEC, String message) {
    return (value) {
      final valueCompare = valueEC?.text ?? '';
      if (value == null || value != valueCompare) {
        return message;
      }
    };
  }
}
