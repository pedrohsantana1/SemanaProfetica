import 'package:flutter/material.dart';
import '../comuns/cabecalho.dart';
import '../comuns/rodape.dart';
import 'package:url_launcher/url_launcher.dart';

class Ofertas extends StatefulWidget {
  @override
  _OfertasState createState() => _OfertasState();
}

class _OfertasState extends State<Ofertas> {
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFe7e7e7),
        child: ListView(
          children: <Widget>[
            Cabecalho(),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            margin: EdgeInsets.all(30),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Color(0xFF3C5A99),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: SizedBox.expand(
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Dízimo / Oferta",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child: Icon(Icons.monetization_on, color: Colors.white,),
                                        height: 28,
                                        width: 28,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  _launchURL();
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Rodape()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://web.inchurch.com.br/#/donation_types/eyJ0ZXJ0aWFyeWdyb3VwX2lkIjogNDAsICJhcHBfaWQiOiAiYnIuY29tLmludGVybmFjaW9uYWxkYXJlbm92YWNhbyJ9';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
