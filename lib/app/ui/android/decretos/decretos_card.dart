import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';


import '../pedidos/pedidos_page.dart';


class DecretosCard extends StatefulWidget {

  String titulo;


  DecretosCard({this.titulo});

  @override
  _DecretosCardState createState() => _DecretosCardState();
}

class _DecretosCardState extends State<DecretosCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: 
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        height: 50,
        child: FlatButton(
            onPressed: () {
              Get.offAndToNamed(Routes.PEDIDOS, arguments: widget.titulo);
            },
            child: Text(
              widget.titulo,
              style: TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
