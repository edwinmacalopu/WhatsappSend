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
    return Scaffold(
      backgroundColor: Colors.white,
       body:Stack(
          children: <Widget>[
            _historial(),
            _cabecera(),
          ],
       ),
      
    );
    
  }
  Widget _cabecera(){
     return Positioned(
       width: MediaQuery.of(context).size.width,
       top: 60,
       child: Container(        
            padding: EdgeInsets.only(left:20,right: 20),
           child: Row(
           children: <Widget>[
             Text("Historial",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
           ],
         ),

       ),
     );
   } 
   Widget _historial(){
     return Positioned(
       top: 80,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-130,
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
                  padding: EdgeInsets.only(left:20,right: 20),
                  //color: Colors.red,
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
       
     );

   }
     _launchURL(String numero) async {     
 var whatsappUrl ="whatsapp://send?phone=${numero.toString()}&text=${""}";
await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  
}
}