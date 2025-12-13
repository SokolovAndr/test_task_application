import 'package:flutter/material.dart';

class AppFabTheme extends FloatingActionButtonThemeData {
  const AppFabTheme()
    : super(
        shape: const CircleBorder(),
        sizeConstraints: const BoxConstraints(minHeight: 64, minWidth: 64),
      );
}
