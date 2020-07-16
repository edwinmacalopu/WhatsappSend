import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsappsend/model/contactwhat.dart';
import 'package:intl/intl.dart';
class ProviderHive extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController numbertel = TextEditingController();
  TextEditingController message = TextEditingController();
  bool _buttonenable = false;

  int codcountry = 51;
  List<Contact> _contacts = [];
  int get codcountrys => codcountry;
  bool get buttonenable => _buttonenable;
  void changebutton(String value) {
    if (value.length > 1) {
      _buttonenable = true;
    } else {
      _buttonenable = false;
    }
    notifyListeners();
  }

  set codcountrys(int code) {
    codcountry = code;
    print("codigo de pais es" + codcountry.toString());
  }

  void getContact() async {
    var box = await Hive.openBox<Contact>('contacts');
    _contacts = box.values.toList();
    notifyListeners();
  }

  Contact getcontact(index) {
    return _contacts[index];
  }

  int get contactCount => _contacts.length;
  
  void saveContact() async {
    final newContact =
    Contact(
      name.text.isEmpty?'sin nombre':name.text,
       int.parse(codcountry.toString()+numbertel.text),
       DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateTime.now().toString()));
    addContact(newContact);
  }

  void addContact(Contact newContact) async {
    var box = await Hive.openBox<Contact>('contacts');
    await box.add(newContact);
    _contacts = box.values.toList();
    sendwhatsapp(codcountry.toString()+numbertel.text,message.text);
    name.clear();
    numbertel.clear();
    message.clear();
    notifyListeners();
  }

  void deleteContact(key) async {
    var box = await Hive.openBox<Contact>('contacts');
    await box.deleteAt(key);
    _contacts = box.values.toList();
    notifyListeners();
  }

  void sendwhatsapp(String number,String message) async {
    var whatsappUrl =
        "whatsapp://send?phone=$number&text=$message";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
