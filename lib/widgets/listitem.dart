import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/model/contactwhat.dart';
import '../iconswhapp_icons.dart';

class Listitems extends StatelessWidget {
  final int tindex;
  const Listitems({Key key, this.tindex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHive>(builder: (context, contact, child) {
      Contact currentcontact = contact.getcontact(tindex);
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    currentcontact.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    currentcontact.number.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currentcontact.time.toString(),
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            )),
            SizedBox(
              width: 20,
            ),
            InkWell(
              splashColor: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Icon(
                Iconswhapp.trash_alt,
                size: 25,
              ),
              onTap: () {
                Provider.of<ProviderHive>(context, listen: false)
                    .deleteContact(tindex);
              },
            ),
            SizedBox(
              width: 30,
            ),
            InkWell(
              splashColor: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Icon(Iconswhapp.message, size: 25),
              onTap: () {
                Provider.of<ProviderHive>(context, listen: false)
                    .sendwhatsapp(currentcontact.number.toString(),"");
                //_launchURL(item.numero);
              },
            ),
          ],
        ),
      );
    });
  }
}
