import 'package:flavor/localization/generated/app_localizations.dart';
import 'package:flutter/material.dart';

abstract class BaseLocalizations {
  AppLocalizations getAll(BuildContext context) => AppLocalizations.of(context);

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  String get appName => 'Base';
}
