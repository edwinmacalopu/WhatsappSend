import 'package:flutter/material.dart';
import 'dart:io';
import 'package:line_icons/line_icons.dart';
class Viewimg extends StatefulWidget {
  final imgview;
  Viewimg(this.imgview);
  @override
  _ViewimgState createState() => _ViewimgState();
}

class _ViewimgState extends State<Viewimg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
              _imagv(),
              _buttondow(),    
             
        ],
      )
            
      
      
    );
  }
  Widget _imagv(){
    return Positioned(
      top: 0,
    // height: height: MediaQuery.of(context).size.height,
      child: Container(        
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:Hero(
                tag: widget.imgview,
                child: Image.file(File(widget.imgview)),
              ),
              
              ),
             
    );
  }
  Widget _buttondow(){
    return Positioned(
      bottom: 30,
      right: 30,
      child: FloatingActionButton(
        child: Icon(LineIcons.download,color: Colors.white,),
         onPressed: (){},   
      )
             
    );
  }
}