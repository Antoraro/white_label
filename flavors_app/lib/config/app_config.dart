import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BuildType { debug, release, profile }

enum Label { base, doub, fib }

const String _methodChannelName = 'flavor';
const String _methodName = 'getFlavor';

sealed class AppConfig {
  final BuildType _buildType;
  const AppConfig(this._buildType);

  BuildType get buildType => _buildType;
  String get appName;
  ThemeData get theme;
  String get assetsPath;
  List<Locale> get supportedLocales;
}

class BaseConfig extends AppConfig {
  BaseConfig(super.flavor);

  @override
  String get appName => 'Base';

  @override
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      );

  @override
  String get assetsPath => 'assets/base';

  @override
  List<Locale> get supportedLocales => const <Locale>[
        Locale('en'),
        Locale('uk'),
      ];
}

class DoubConfig extends AppConfig {
  DoubConfig(super.flavor);

  @override
  String get appName => 'Double';

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      );

  @override
  String get assetsPath => 'assets/double';

  @override
  List<Locale> get supportedLocales => const <Locale>[
        Locale('uk'),
      ];
}

class FibConfig extends AppConfig {
  FibConfig(super.flavor);

  @override
  String get appName => 'Fib';

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
      );

  @override
  String get assetsPath => 'assets/fib';

  @override
  List<Locale> get supportedLocales => const <Locale>[
        Locale('en'),
      ];
}

Future<AppConfig> getAppConfig() async {
  final (label, buildType) = await _getLabelAndBuildTypeFromPlatform();

  return switch (label) {
    Label.base => BaseConfig(buildType),
    Label.doub => DoubConfig(buildType),
    Label.fib => FibConfig(buildType),
  };
}

Future<(Label, BuildType)> _getLabelAndBuildTypeFromPlatform() async {
  Label label = Label.base;
  BuildType buildType = BuildType.debug;
  try {
    String? flavorString = await (const MethodChannel(_methodChannelName))
        .invokeMethod<String>(_methodName);
    if (flavorString != null) {
      if (flavorString == Label.fib.name) {
        label = Label.fib;
      } else if (flavorString == Label.doub.name) {
        label = Label.doub;
      }

      if (kProfileMode) {
        buildType = BuildType.profile;
      } else if (kReleaseMode) {
        buildType = BuildType.release;
      }
    }
  } catch (e) {
    log('Failed: ${e.toString()}', name: 'AppConfig');
    log('FAILED TO LOAD FLAVOR', name: 'AppConfig');
  }
  return (label, buildType);
}
