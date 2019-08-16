import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.greenAccent, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark
     
  ));  
  runApp(MaterialApp(     
    home: MyHome(),
    ));
}  
 class MyHome extends StatefulWidget {
   MyHome({Key key}) : super(key: key);
 
   _MyHomeState createState() => _MyHomeState();
 }
 
 class _MyHomeState extends State<MyHome> {
  final TextEditingController numerotelefonico=TextEditingController();
   final TextEditingController mensaje=TextEditingController();
   final TextEditingController nombre=TextEditingController();
 final TextEditingController pais=TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       resizeToAvoidBottomPadding: false,         
        body: 
            Stack(
            children: <Widget>[
              _cabecera(),
              _cuentaenvio(),
            ],
        ),
        
     );
     
   } 
   Widget _cabecera(){
     return Positioned(
       width: MediaQuery.of(context).size.width,
       top: 40,
       child: Container(
        
         child: Column(
           children: <Widget>[
               Image.asset('assets/home.png'),
               SizedBox(
                 height: 20,
               ),
              Text("Schat whatsapp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

           ],
         ),

       ),
     );
   }   

   Widget _cuentaenvio(){
     return Positioned(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
            top: 160,
       child: Container(
            padding: EdgeInsets.only(left:40,right: 40),
         child: Column(                 
              
            children: <Widget>[            
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nombre,
                decoration: InputDecoration(  
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20)
                         ),
                          hintText: 'nombre',
                          
                          ),
              ) ,
               SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    child: TextField(
                controller: pais,
                decoration: InputDecoration(  
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20)
                         ),
                         
                          hintText: '+51',
                          
                          ),
              ) ,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                 Expanded(                    
                   child:   TextField(
                controller: numerotelefonico,
                decoration: InputDecoration(  
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20)
                         ),
                          hintText: 'Número de Celular',
                          
                          ),
              ),
                 )

                
                ],
              ),
               SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                controller: mensaje,
                decoration: InputDecoration(  
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20)
                         ),
                          hintText: 'Mensaje'
                          ),
              ),
              
                  ),
                  SizedBox(
                width: 10,
              ),
            
              FloatingActionButton(
                elevation: 1,
                backgroundColor: Colors.greenAccent,
                 child: Icon(Icons.send,color: Colors.white,),
                onPressed: (){},
              ),
                 

               
                  
                ],
              ),
               SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: 
                  _launchURL,                
                child: Text('ABRIR WHATSAPP',style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Color.fromARGB(255, 33, 211, 124),
              ),
               SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: 
                _borrartext,                
                child: Text('BORRAR DATOS',style: TextStyle(color: Colors.white),),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.red,
              )
            ],
          ),
          )
         
     );
   }
   _launchURL() async {
     
 var whatsappUrl ="whatsapp://send?phone=${numerotelefonico.text}&text=${mensaje.text}";
await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  _borrartext();
}

_borrartext(){
  numerotelefonico.text="";
  mensaje.text="";
}
}

      
    