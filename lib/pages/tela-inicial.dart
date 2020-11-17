import 'package:flutter/material.dart';
import 'package:semana_profetica/pages/cabecalho.dart';
import 'package:semana_profetica/pages/rodape.dart';
import 'package:semana_profetica/pages/tela-Inicial-card.dart';

class TelaInicial extends StatefulWidget {
  
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
 

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
                     // height: MediaQuery.of(context).size.height - 120,
                      //color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ListView(
                          children: <Widget>[
                            CardInicial(titulo: "Venha celebrar conosco!",descricao: "Celebração das 10h e 18h30 aos Domingos!", imagem: "assets/post01.png",),
                            CardInicial(titulo: "Já leu sua bíblia hoje?",descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehi", imagem: "assets/post02.jpg",),
                            CardInicial(titulo: "Venha celebrar conosco!",descricao: "Celebração das 10h e 18h30 aos Domingos!", imagem: "assets/post01.png",),
                          ],
                        ),
                      ),
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


