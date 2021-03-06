import 'package:flutter/material.dart';
import 'package:whatsappsend/ui/saved.dart';
import 'package:whatsappsend/ui/home.dart';
import 'package:whatsappsend/ui/status.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';

class NavbarPage extends StatefulWidget {
  NavbarPage({Key key}) : super(key: key);

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _currentIndex = 0;
  Widget callpage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Saved();
      case 2:
        return Status();
        break;
      default:
        return Home();
    }
  }

  Image myImage1, myImage2, myImage3;

  @override
  void initState() {
    super.initState();
    myImage1 = Image.asset('assets/nostatus.png');
    myImage2 = Image.asset('assets/permission.png');
    myImage3 = Image.asset('assets/nofound.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage1.image, context);
    precacheImage(myImage2.image, context);
    precacheImage(myImage3.image, context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: callpage(_currentIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Iconswhapp.message), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Iconswhapp.users_alt), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Iconswhapp.circle), title: Text('')),
          //BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('busqueda')),
        ],
        fixedColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
