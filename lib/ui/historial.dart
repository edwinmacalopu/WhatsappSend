import 'package:flutter/material.dart';
import 'package:whatsappsend/bd/database.dart';
import 'package:whatsappsend/model/modelschat.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';


class Historial extends StatefulWidget {
  Historial({Key key}) : super(key: key);

  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  void didUpdateWidget(Historial oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() { 
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
         body:Container(
           padding: EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               SizedBox(height: 20),
               Text("Historial",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20),
              Container(
                 child: FutureBuilder<List<Manager>>(
           future: ManagerDatabaseProvider.db.getAllManager(),
           builder: (BuildContext context,AsyncSnapshot<List<Manager>>snapshot){
             if(snapshot.hasData){
               return ListView.builder(
                 //reverse: true,
                 shrinkWrap: true,
                 physics: BouncingScrollPhysics(),
                 itemCount: snapshot.data.length,
                 itemBuilder: (BuildContext context,int index){
                   Manager item=snapshot.data[index];
                  return Container(
                 
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         
                         Expanded(
                           child:Container(
                             height: 80,
                             child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                            Text(item.nombre,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 3,
                            ),
                            Text(item.numero,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),) , 
                            
                            Text(item.fecha,style: TextStyle(fontSize: 10),) 
                           ],
                         ) ,
                           )
                         ),
                          
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            splashColor:Colors.greenAccent, 
                                    borderRadius: BorderRadius.all(Radius.circular(20)),    
                              child:  Icon(LineIcons.trash,size: 30,),
                              onTap: (){
                                ManagerDatabaseProvider.db.deleteManagerithId(item.id);
                                setState(() {
                                  
                                });
                              },
                          ),
                         
                           SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            splashColor:Colors.greenAccent, 
                                    borderRadius: BorderRadius.all(Radius.circular(20)),    
                                    child: Icon(LineIcons.whatsapp,size: 30),
                                    onTap: (){
                                       _launchURL(item.numero);
                                    },
                          ),
                          
                        
                       ],
                     ),     
                  );
                 },
               );
             }else{
               return Center(child: CircularProgressIndicator());
             }
           },
         ),
               ) 
             ],
           ),
         )
        
      ),
    );
    
  }
  
   
     _launchURL(String numero) async {     
 var whatsappUrl ="whatsapp://send?phone=${numero.toString()}&text=${""}";
await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  
}
}