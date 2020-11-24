import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(left: 10, right: 10, top: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        height: 60,
        child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Pedidos()));
            },
            child: Text(
              widget.titulo,
              style: TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
