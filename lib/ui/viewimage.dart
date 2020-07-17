import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';
import 'dart:io';
import 'package:whatsappsend/generated/l10n.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';

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
            Center(child:
                Consumer<ProviderStatus>(builder: (context, progress, widget) {
              return Visibility(
                  visible: progress.visible,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                    ),
                  ));
            })),
            Consumer<ProviderStatus>(builder: (context, visicheck, widget) {
              return visicheck.visiblecheck == true
                  ? Center(
                      child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Iconswhapp.check_circle,
                              size: 50, color: Colors.green),
                          SizedBox(height: 20),
                          Text(S.of(context).alertmessage,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ))
                  : Container();
            }),
          ],
        ));
  }

  Widget _imagv() {
    return Positioned(
      top: 0,
      // height: height: MediaQuery.of(context).size.height,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: widget.imgview,
          child: Image.file(File(widget.imgview)),
        ),
      ),
    );
  }

  Widget _buttondow() {
    return Positioned(
        bottom: 30,
        right: 30,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 22, 219, 147),
          child: Icon(
            Iconswhapp.image_download,
            color: Colors.white,
          ),
          onPressed: () async {
            Provider.of<ProviderStatus>(context, listen: false)
              ..visible = true
              ..saveimage(widget.imgview);
          },
        ));
  }
}
