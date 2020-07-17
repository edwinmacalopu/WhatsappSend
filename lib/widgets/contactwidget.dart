import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappsend/bloc/providehive.dart';
import 'package:whatsappsend/widgets/listitem.dart';

class Contactw extends StatelessWidget {
  const Contactw({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        //reverse: true,
        //RshrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: Provider.of<ProviderHive>(context).contactCount,
        itemBuilder: (BuildContext context, int index) {
          return Listitems(tindex: index);
        },
      ),
    );
  }
}
