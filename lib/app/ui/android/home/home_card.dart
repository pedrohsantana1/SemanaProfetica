import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Image.asset(
              widget.imagem,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              widget.titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
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
                    onPressed: () {
                      if (isFavorite == true) {
                        setState(() {
                          isFavorite = false;
                        });
                      } else {
                        setState(() {
                          isFavorite = true;
                        });
                      }
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.black,
                    )),
                FlatButton(
                    onPressed: () async {
                      final ByteData bytes =
                          await rootBundle.load(widget.imagem);
                      await Share.file('esys image', 'esys.png',
                          bytes.buffer.asUint8List(), 'image/png',
                          text: 'Semana Profética - Igreja Nova Chance - entre os dias 26 a 06 de dezembro de 2020\n' +
                              widget.descricao +
                              "\nAcompanhe também pelo nosso canal no youtube\n https://www.youtube.com/user/Studioiir");
                    },
                    child: Icon(Icons.share, color: Colors.black45)),
                FlatButton(
                    onPressed: () async {
                      _launchURL();
                    },
                    child: Icon(Icons.tv, color: Colors.black45)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.youtube.com/watch?v=6779UlSEYDs&feature=youtu.be';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
