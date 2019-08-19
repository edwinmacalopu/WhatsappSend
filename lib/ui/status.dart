import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:whatsappsend/ui/viewimage.dart';
 class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<FileSystemEntity> files;
  var imageList;
  
  Future _getlocalfile()async{
 final _photodir=Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
   imageList = _photodir.listSync().map((item) => item.path).where((
          item) => item.endsWith(".jpg")).toList(growable: false); 
 print(imageList);
 setState(() {
   
 });
  }  
@override
void initState(){
  super.initState();
  _getlocalfile();
}
  
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: <Widget>[
          _cabecera(),
          _gridv(),
          
        ],
      )
    );
  }
  Widget _cabecera(){
    return Positioned(
      top: 60,
      child:  
        Container(         
               padding: EdgeInsets.only(left:20,right: 20),  
               child:  Row(
        children: <Widget>[
            Text("Estados",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
         /* RaisedButton(onPressed: 
            _getlocalfile
           ,)*/
        ],
      ),
      )
     
      );
    
  }
  Widget _gridv(){
    return Positioned(
      top: 100,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-150,
      child: GridView.builder(
        itemCount: imageList==null ?0:imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
        itemBuilder: (BuildContext context,int index){
          String imgpatch=imageList[index];
            return Container(         
               padding: EdgeInsets.only(left:10,right: 10,top: 10),  
             child: InkWell(
               child:  Hero(
                tag: imgpatch,
                child: Image.file(File(imgpatch),fit: BoxFit.cover,),
              ),
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Viewimg(imgpatch)),
              );
              }
             ),
                
                
            
            );
        }
      )
      
    );
  }
  

  
  
}

