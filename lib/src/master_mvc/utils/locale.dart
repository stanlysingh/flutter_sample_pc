import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'ok': 'ok',
      'cancel': 'cancel',
    },
    'ar': {
      'ok': 'ok',
      'cancel': 'cancel',
    }
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode][key];
  }

  static String of(BuildContext context, String key) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations)
        .translate(key);
  }


  String get cancel {
    return _localizedValues[locale.languageCode]['cancel'];
  }

  String get ok {
    return _localizedValues[locale.languageCode]['ok'];
  }

}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
