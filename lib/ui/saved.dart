import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsappsend/model/contactwhat.dart';
import 'package:line_icons/line_icons.dart';

class Saved extends StatefulWidget {
  Saved({Key key}) : super(key: key);

  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
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
                Container(
                  child: FutureBuilder(
                    future: Hive.openBox('contacts'),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        final contactbox = Hive.box('contacts');
                        return ListView.builder(
                          //reverse: true,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: contactbox.length,
                          itemBuilder: (BuildContext context, int index) {
                            final contact = contactbox.get(index) as Contact;
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          contact.name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          contact.number.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          contact.time.toString(),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Icon(
                                      LineIcons.trash,
                                      size: 30,
                                    ),
                                    onTap: () {
                                     /* ManagerDatabaseProvider.db
                                          .deleteManagerithId(item.id);
                                      setState(() {});*/
                                    },
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                    splashColor: Colors.greenAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Icon(LineIcons.whatsapp, size: 30),
                                    onTap: () {
                                      //_launchURL(item.numero);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
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
