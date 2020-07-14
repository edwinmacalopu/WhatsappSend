import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/widgets/contactwidget.dart';

class Saved extends StatelessWidget {
  Saved({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderHive>(context).getContact();
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
                  "Historial",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                     child: Contactw(),
                    ),                   
                )
              ],
            ),
          )),
    );
  }

  /* _launchURL(String numero) async {
    var whatsappUrl = "whatsapp://send?phone=${numero.toString()}&text=${""}";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }*/
}
