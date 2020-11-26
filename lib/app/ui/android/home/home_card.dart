import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';


class CardInicial extends StatefulWidget {

  String titulo;
  String descricao;
  String imagem;

  CardInicial({this.titulo, this.descricao, this.imagem});

  @override
  _CardInicialState createState() => _CardInicialState();
}

class _CardInicialState extends State<CardInicial> {
  bool isFavorite = false;
  

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

                      onPressed: (){
                        if(isFavorite == true){
                          setState(() {
                            isFavorite = false;
                          });
                        }
                        else{
                          setState(() {
                            isFavorite = true;
                          });
                        }
                        
                        
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.red: Colors.black,
                      )
                  ),
                  FlatButton(
                      onPressed: () async {
                        final ByteData bytes = await rootBundle.load('assets/post01.png');
                        await Share.file('esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png', text: 'Semana Profética - Igreja Nova Chance');
                      },
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