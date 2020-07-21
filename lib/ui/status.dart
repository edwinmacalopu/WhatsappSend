import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';
import 'package:whatsappsend/generated/l10n.dart';
import 'package:whatsappsend/widgets/listphotos.dart';

class Status extends StatelessWidget {
  Status({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      Consumer<ProviderStatus>(
                        builder: (context, statrage, widget) {
                          return statrage.statuspermstorage == true
                              ? InkWell(
                                  splashColor: Colors.greenAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Icon(
                                    Iconswhapp.repeat,
                                    color: Colors.black,
                                    semanticLabel: "Actualizar",
                                  ),
                                  onTap: () {
                                    Provider.of<ProviderStatus>(context,
                                            listen: false)
                                        .getlocalfile();
                                  },
                                )
                              : Container();
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(child: Consumer<ProviderStatus>(
                      builder: (context, statusStorage, widget) {
                        return statusStorage.statuspermstorage == true
                            ? ListPhotos()
                            : Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.9,
                                        child: const Image(
                                            image: AssetImage(
                                                'assets/permission.png'))),
                                    SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      child: Text(
                                        S.of(context).permission,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    RaisedButton(
                                        onPressed: () async {
                                          Provider.of<ProviderStatus>(context,
                                                  listen: false)
                                              .grandPermissionStorage();
                                        },
                                        color:
                                            Color.fromARGB(255, 22, 219, 147),
                                        child: Text(
                                          S.of(context).buttonpermision,
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                              );
                      },
                    )),
                  )
                ],
              ))),
    );
  }
}
