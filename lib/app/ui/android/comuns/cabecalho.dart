import 'package:flutter/material.dart';

class Cabecalho extends StatefulWidget {
  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Image.asset(
                    "assets/logo-nome.png",
                    width: 100,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/perfil.jpg"),
                      radius: 20,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
