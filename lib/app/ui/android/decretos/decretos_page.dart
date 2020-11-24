import 'package:flutter/material.dart';
import 'package:semana_profetica/app/ui/android/comuns/cabecalho.dart';
import 'package:semana_profetica/app/ui/android/comuns/rodape.dart';
import 'decretos_card.dart';



class DecretosPage extends StatefulWidget {
  @override
  _DecretosPageState createState() => _DecretosPageState();
}

class _DecretosPageState extends State<DecretosPage> {
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 10,),
                        child: ListView(
                          children: <Widget>[
                            Center(
                              
                              child:Text(
                                  "Decretos",
                                style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                             ), 
                            ),
                            DecretosCard(titulo: "Família",),
                            DecretosCard(titulo: "Relacionamento",),
                            DecretosCard(titulo: "Financeiro",),
                            DecretosCard(titulo: "Trabalho",),
                            DecretosCard(titulo: "Estudos",),
                            DecretosCard(titulo: "Família",),
                            DecretosCard(titulo: "Família",),
                            
                                        
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