import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';
import 'package:whatsappsend/ui/navbar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'model/contactwhat.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatsappsend/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(ContactAdapter(), 0);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Color.fromARGB(255, 22, 219, 147), // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderHive()..getContact()),
        ChangeNotifierProvider(create: (_) => ProviderStatus())
      ],
      child: MaterialApp(
        theme: ThemeData(
            accentColor: Color.fromARGB(255, 22, 219, 147),
            primaryColor: Color.fromARGB(255, 22, 219, 147)
            ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'WhatsapppSend',
        home: NavbarPage(),
      ),
    );
  }
}
