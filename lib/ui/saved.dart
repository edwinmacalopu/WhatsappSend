import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/generated/l10n.dart';
import 'package:whatsappsend/widgets/contactwidget.dart';

class Saved extends StatelessWidget {
  Saved({Key key}) : super(key: key);

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
                Text(
                  S.of(context).titlehome,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(child: Consumer<ProviderHive>(
                      builder: (context, contactprov, widget) {
                    return contactprov.contactCount == 0
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.9,
                                    child: const Image(
                                        image:
                                            AssetImage('assets/nofound.png'))),
                                SizedBox(height: 10),
                                Text(
                                  S.of(context).nullrecord,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        : Contactw();
                  })),
                )
              ],
            ),
          )),
    );
  }
}
