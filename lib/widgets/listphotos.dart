import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';
import 'package:whatsappsend/generated/l10n.dart';
import 'package:whatsappsend/ui/viewimage.dart';

class ListPhotos extends StatelessWidget {
 ListPhotos({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderStatus>(context).getlocalfile();
    return Container(
      child: Consumer<ProviderStatus>(
        builder:(context,listphotos,windget){
          return listphotos.imageList.length==0?Container(
                     child: Center(
                            child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Container(
                          width: MediaQuery.of(context).size.width/1.9,
                          child:const Image(image:AssetImage('assets/nostatus.png'))),
                           SizedBox(height: 10),
                           Text(S.of(context).nullstatus,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                           ],
                         )))
          :GridView.builder(
                            itemCount: listphotos.imageList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 5,mainAxisSpacing: 5
                                    ),
                            itemBuilder: (BuildContext context, int index) {
                              String imgpatch = listphotos.imageList[index];
                              return Container(
                                child: InkWell(
                                    child: Hero(
                                      tag: imgpatch,
                                      child: Image.file(
                                        File(imgpatch),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Viewimg(imgpatch)),
                                      );
                                    }),
                              );
                            });
                      }));
  }
}