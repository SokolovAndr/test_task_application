import 'package:flutter/material.dart';

extension DefaultInputDecoration on InputDecoration {
  static InputDecoration get def => InputDecoration(
    prefix: Padding(padding: defaultLeftPadding),
    suffixIconConstraints: const BoxConstraints(maxHeight: 40),
  );
  static EdgeInsetsGeometry get defaultLeftPadding =>
      const EdgeInsets.only(left: 12);
}
