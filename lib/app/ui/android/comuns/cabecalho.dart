import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/controller/home_controller.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';

class Cabecalho extends StatefulWidget {
  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Image.asset(
                    "assets/logo-nome.png",
                    width: 100,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: 
                    /*
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/user-icon.png"),
                      radius: 20,
                      
                    )*/
                    FlatButton(
                      onPressed: () { 
                         Get.offAllNamed(Routes.PERFIL, arguments: _homeController.user);
                       },
                      child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/perfil.png"),
                      radius: 22,
                      
                    ),
                  )

                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
