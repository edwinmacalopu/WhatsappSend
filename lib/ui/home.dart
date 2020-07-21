import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/generated/l10n.dart';
import 'package:whatsappsend/widgets/customText.dart';
import 'package:whatsappsend/bloc/providerstatus.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderStatus>(context, listen: false).getPermissionStorage();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          child: const Image(
                              image: AssetImage('assets/home2.png'))),
                      const Text(
                        "Schat whatsapp",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomText(
                    controller: hprovid.name,
                    hintext: S.of(context).textname,
                    typeinput: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
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
                      Icon(Icons.arrow_drop_down, color: Colors.black45),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomText(
                          controller: hprovid.numbertel,
                          hintext: S.of(context).textnumtel,
                          typeinput: false,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<ProviderHive>(builder: (context, logitude, widget) {
                    return TextField(
                      controller: logitude.message,
                      decoration: InputDecoration(
                        focusColor: Colors.grey[200],
                        filled: true,
                        fillColor: Color.fromARGB(90, 243, 245, 249),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: S.of(context).textmessage,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                      onChanged: (value) => logitude.changebutton(value),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<ProviderHive>(builder: (context, boton, widget) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: RaisedButton(
                          onPressed: boton.buttonenable == false
                              ? null
                              : boton.saveContact,
                          disabledColor: Colors.grey.withOpacity(0.3),
                          textColor: Colors.white,
                          color: boton.buttonenable == false
                              ? Colors.grey.withOpacity(0.2)
                              : Color.fromARGB(255, 22, 219, 147),
                          child: Text(S.of(context).buttonsend)),
                    );
                  }),
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
