import 'package:flutter/material.dart';

class CardInicial extends StatefulWidget {

  String titulo;
  String descricao;
  String imagem;

  CardInicial({this.titulo, this.descricao, this.imagem});

  @override
  _CardInicialState createState() => _CardInicialState();
}

class _CardInicialState extends State<CardInicial> {
  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              child: Image.asset(widget.imagem,),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,),
              child: Text(
                widget.titulo,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,),
              child: Text(
                widget.descricao,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                ),
              ),
            ),
            ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                      onPressed: (){},
                      child: Icon(
                          Icons.favorite,
                        color: Colors.black45,
                      )
                  ),
                  FlatButton(
                      onPressed: (){},
                      child: Icon(
                          Icons.share,
                          color: Colors.black45
                      )
                  ),
                ],
              ),
            )
          ],
        ),    
    );
  }
}