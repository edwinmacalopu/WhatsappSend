import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappsend/bd/database.dart';
import 'package:whatsappsend/model/modelschat.dart';
import 'package:date_format/date_format.dart';
//import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   final TextEditingController numerotelefonico=TextEditingController();
   final TextEditingController mensaje=TextEditingController();
   final TextEditingController nombre=TextEditingController();
 final TextEditingController pais=TextEditingController();
 String codigopais="+51";

    void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() { 
      
    });
  }
   
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
       top: 80,
       child: Container(
        
         child: Column(
           children: <Widget>[
               Container(
                 height: 120,
                 width: 120,
                 child: Image.asset('assets/home2.png'),
               ),
               SizedBox(
                 height: 10,
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
            top: 240,
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
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.all(
                          Radius.circular(20),
                          
                      ),
                     
                    ),
                    child:CountryCodePicker(
                   onChanged: (prints){ 
                        codigopais=prints.toString();
                         
                   },
                   
                   initialSelection: 'PE',
                   favorite: ['+51','PE'],
                   showCountryOnly: false,
                   showOnlyCountryWhenClosed: false,
                   alignLeft: false,
                 ),
               ),
                   
                  SizedBox(
                    width: 10,
                  ),
                 Expanded(                    
                   child:   TextField(
                controller: numerotelefonico,
                decoration: InputDecoration(                   
                          contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15), 
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
                onPressed: _launchURL,
              ),                       
                ],
              ),
               SizedBox(
                height: 30,
              ),
               
              
            ],
          ),
          )
         
     );
   }
  
 _addhistory(String fechayhora) async{                 
           await  ManagerDatabaseProvider.db.addManagerToDatabase(new Manager(nombre: nombre.text,
          numero: codigopais+numerotelefonico.text,fecha: fechayhora));                       
                } 
   
  
   _launchURL() async { 
       
    String date=formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]);
  
      _addhistory(date);

     
 var whatsappUrl ="whatsapp://send?phone=${codigopais+numerotelefonico.text}&text=${mensaje.text}";
await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed"); 
  _borrartext();
}

_borrartext(){
  numerotelefonico.text="";
  mensaje.text="";
  nombre.text="";
}

}