import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/controller/home_controller.dart';
import 'package:semana_profetica/app/data/model/teste-model.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';

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
                            CardInicial(titulo: "Semana Profética",descricao: "Convite especial do Ap. Sérgio Paulo", imagem: "assets/apostolo.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar saúde para você e sua família", imagem: "assets/saude.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar estudos para você e sua família", imagem: "assets/estudos.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar sobre a sua família e casamento", imagem: "assets/familia.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar fé e ministério para você e sua família", imagem: "assets/fe.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar finanças para você e sua família", imagem: "assets/financas.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar gratidão para você e sua família", imagem: "assets/gratidao.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar imóveis e veiculos para você e sua família", imagem: "assets/imovel.jpg",),
                            CardInicial(titulo: "Semana Profética",descricao: "Venha profetizar salvação para você e sua família", imagem: "assets/salvacao.jpg",),

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


