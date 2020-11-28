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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.black12,
                            ),
                            height: 80,
                            // width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                                onPressed: () {
                                  _launchURL();
                                },
                                child: Text(
                                  "Dízimo / Oferta",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
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
