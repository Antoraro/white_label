import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get seed => Colors.blue;

  ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
      );
}
