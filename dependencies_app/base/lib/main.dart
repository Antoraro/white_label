import 'package:base/home_page.dart';
import 'package:flavor/config/flavor_localizations.dart';
import 'package:flavor/config/flavor_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = FlavorLocalizations();
    final theme = FlavorTheme();
    final child = HomePage();

    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: localizations.appName,
      supportedLocales: localizations.supportedLocales,
      localizationsDelegates: localizations.localizationsDelegates,
      theme: theme.themeData,
      home: child,
    );
  }
}
