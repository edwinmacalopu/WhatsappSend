import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsappsend/ui/historial.dart';
import 'package:whatsappsend/ui/home.dart';
import 'package:whatsappsend/ui/status.dart';
 


void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.greenAccent, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark
     
  ));  
  
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,    
    home: MyHome(),
    ));
}  
 class MyHome extends StatefulWidget {
   MyHome({Key key}) : super(key: key);
 
   _MyHomeState createState() => _MyHomeState();
 }
 
 class _MyHomeState extends State<MyHome> {
  int _currentIndex=0;
  Widget callpage(int currentIndex){
    switch (currentIndex) {
      case 0:return Home();
        case 1: return Historial();
        case 2: return Status();
        //case 3: return Estacion();
        break;
      default:return Home();
    }
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(   
      
      resizeToAvoidBottomInset: false,    
      body: callpage(_currentIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        onTap: (value){
          _currentIndex=value;
            setState(() {
              
            });
        },
        items: [  
          BottomNavigationBarItem(icon: Icon(LineIcons.paper_plane),title:Text('enviar')),
           BottomNavigationBarItem(icon: Icon(LineIcons.history),title: Text('guardados')),
            BottomNavigationBarItem(icon: Icon(LineIcons.circle_o_notch),title: Text('estados')),
             //BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('busqueda')),
        ],
      
        fixedColor: Colors.black,        
        backgroundColor: Colors.white,
      ),
    );
  }
 
  
}

      
    