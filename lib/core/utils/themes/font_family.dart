import 'package:flutter/material.dart';

extension DefaultFontFamily on TextStyle {
  TextStyle def() => copyWith(fontFamily: 'Roboto');
}

extension DefaultFontFamilyTheme on TextTheme {
  TextTheme def() => apply(fontFamily: 'Roboto');
}
