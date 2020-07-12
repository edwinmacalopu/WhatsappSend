import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappsend/bd/database.dart';
import 'package:whatsappsend/model/contactwhat.dart';
import 'package:whatsappsend/model/modelschat.dart';
import 'package:date_format/date_format.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';
//import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController numerotelefonico = TextEditingController();
  final TextEditingController mensaje = TextEditingController();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController pais = TextEditingController();
  String codigopais = "+51";

  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/home2.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Schat whatsapp",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: nombre,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'nombre',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: CountryCodePicker(
                          onChanged: (prints) {
                            codigopais = prints.toString();
                          },
                          initialSelection: 'PE',
                          favorite: ['+51', 'PE'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: numerotelefonico,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Número de Celular',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: mensaje,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Mensaje'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Color.fromARGB(255, 22, 219, 147),
                        child: Icon(
                          Iconswhapp.message,
                          color: Colors.white,
                        ),
                        onPressed: _launchURL,
                      ),
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Iconswhapp.message,
                          color: Colors.white,
                        ),
                        onPressed: () async{
                          await Hive.openBox('contacts');
                          final newContact = Contact(nombre.text,
                              int.parse(numerotelefonico.text), DateTime.now());
                          addcontact(newContact);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void addcontact(Contact contact) {
    final contactbox = Hive.box('contacts');
    contactbox.add(contact);
  }

  _addhistory(String fechayhora) async {
    await ManagerDatabaseProvider.db.addManagerToDatabase(new Manager(
        nombre: nombre.text,
        numero: codigopais + numerotelefonico.text,
        fecha: fechayhora));
  }

  _launchURL() async {
    String date =
        formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]);

    _addhistory(date);

    var whatsappUrl =
        "whatsapp://send?phone=${codigopais + numerotelefonico.text}&text=${mensaje.text}";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
    _borrartext();
  }

  _borrartext() {
    numerotelefonico.text = "";
    mensaje.text = "";
    nombre.text = "";
  }
}
