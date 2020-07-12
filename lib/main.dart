import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:whatsappsend/ui/navbar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/contactwhat.dart';

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
    return MaterialApp(
      theme: ThemeData(
          accentColor: Color.fromARGB(255, 22, 219, 147),
          primaryColor: Color.fromARGB(255, 22, 219, 147)),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: NavbarPage(),
    );
  }
}
