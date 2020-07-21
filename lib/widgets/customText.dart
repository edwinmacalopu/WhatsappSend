import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool typeinput;

  const CustomText({Key key, this.controller, this.hintext, this.typeinput}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return TextField( 
      keyboardType: typeinput?TextInputType.text:
      TextInputType.number,
      cursorColor: Colors.green,
      controller: controller,
      decoration: InputDecoration(
        focusColor: Colors.grey[200],
        filled: true,
        fillColor: Color.fromARGB(90,243, 245, 249),
        hoverColor: Colors.red,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hintext,
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
    );
  }
}
