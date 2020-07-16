// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Record`
  String get titlehome {
    return Intl.message(
      'Record',
      name: 'titlehome',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get titlestatus {
    return Intl.message(
      'Status',
      name: 'titlestatus',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get textname {
    return Intl.message(
      'name',
      name: 'textname',
      desc: '',
      args: [],
    );
  }

  /// `cell phone number`
  String get textnumtel {
    return Intl.message(
      'cell phone number',
      name: 'textnumtel',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get textmessage {
    return Intl.message(
      'message',
      name: 'textmessage',
      desc: '',
      args: [],
    );
  }

  /// `No records saved`
  String get nullrecord {
    return Intl.message(
      'No records saved',
      name: 'nullrecord',
      desc: '',
      args: [],
    );
  }

  /// `Image saved in gallery`
  String get alertmessage {
    return Intl.message(
      'Image saved in gallery',
      name: 'alertmessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}