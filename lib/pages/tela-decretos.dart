import 'package:flutter/material.dart';
import 'package:semana_profetica/pages/rodape.dart';
import 'package:semana_profetica/pages/tela-decretos-card.dart';

import 'cabecalho.dart';

class Decretos extends StatefulWidget {
  @override
  _DecretosState createState() => _DecretosState();
}

class _DecretosState extends State<Decretos> {
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