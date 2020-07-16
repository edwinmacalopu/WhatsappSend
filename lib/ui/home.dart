import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/iconswhapp_icons.dart';
import 'package:whatsappsend/generated/l10n.dart';
class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hprovid = Provider.of<ProviderHive>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    child:const Image(image:AssetImage('assets/home2.png'))
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Schat whatsapp",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: hprovid.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: S.of(context).textname,
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
                            hprovid.codcountrys =
                                (int.parse(prints.toString()));
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
                        keyboardType: TextInputType.number,
                        controller: hprovid.numbertel,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: S.of(context).textnumtel,
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Consumer<ProviderHive>(
                            builder: (context, logitude, widget) {
                          return TextField(
                            controller: logitude.message,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText:  S.of(context).textmessage),
                                onChanged: (value) => logitude.changebutton(value),
                          );
                          
                        }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Consumer<ProviderHive>(builder: (context, boton, widget) {
                        return FloatingActionButton(
                          elevation: 1,
                          backgroundColor: boton.buttonenable == false
                              ? Colors.grey[350]
                              : Color.fromARGB(255, 22, 219, 147),
                          child: Icon(
                            Iconswhapp.message,
                            color: Colors.white,
                          ),
                          onPressed: boton.buttonenable == false
                              ? null
                              : boton.saveContact,
                        );
                      })
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
}
