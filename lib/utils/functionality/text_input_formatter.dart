import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final double min;
  final double max;

  RangeTextInputFormatter({this.min = 0, this.max = 100});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (double.tryParse(newValue.text) == null) {
      return oldValue;
    } else {
      if (double.parse(newValue.text) < min) {
        return oldValue;
      } else if (double.parse(newValue.text) > max) {
        return oldValue;
      } else {
        return newValue;
      }
    }
  }
}
