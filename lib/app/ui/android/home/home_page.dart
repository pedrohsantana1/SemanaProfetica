import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/data/model/teste-model.dart';

import 'package:semana_profetica/app/ui/android/comuns/cabecalho.dart';
import 'package:semana_profetica/app/ui/android/comuns/rodape.dart';

import 'home_card.dart';


class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 // final Teste _teste = Get.arguments;
                  

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

