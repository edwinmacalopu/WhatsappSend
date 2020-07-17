import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';
import 'package:whatsappsend/model/permissions_service.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';
import 'dart:io';
import 'package:whatsappsend/ui/viewimage.dart';
import 'package:whatsappsend/generated/l10n.dart';
class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  
  @override
  void initState() {
    super.initState();
    PermissionsService().requestStoradePermission();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderStatus>(context).getlocalfile();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          S.of(context).titlestatus,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Icon(
                          Iconswhapp.repeat,
                          color: Colors.black,
                          semanticLabel: "Actualizar",
                        ),
                        onTap: () {
                          Provider.of<ProviderStatus>(context, listen: false)
                              .getlocalfile();
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      child: Consumer<ProviderStatus>(
                          builder: (context, provimage, widget) {
                        return provimage.imageList==null?Container(
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
                         ),
                     ),
                     ): GridView.builder(
                            itemCount: provimage.imageList == null
                                ? 0
                                : provimage.imageList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 5,mainAxisSpacing: 5
                                    ),
                            itemBuilder: (BuildContext context, int index) {
                              String imgpatch = provimage.imageList[index];
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
                      }),
                    ),
                  )
                ],
              ))),
    );
  }
}
