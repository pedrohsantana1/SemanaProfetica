import 'package:flutter/material.dart';
import 'package:semana_profetica/app/controller/initial_controller.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:get/get.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  final InitialController _inicial = Get.find();

  @override
  Widget build(BuildContext context) {
        return Stack(
      children: [
      
      Obx (() => SplashScreen (
        seconds: 5,
            backgroundColor: Colors.white,
            navigateAfterSeconds: "${_inicial.verifica}" == "deslogado"? Routes.LOGIN : Routes.HOME,
            loaderColor: Colors.transparent,
      )),


      //  Obx (() => Text("${_inicial.verifica}")),


        Container(
            margin: EdgeInsets.all(140),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo-preta.png"),
                    fit: BoxFit.contain)))
      ],
    );
  }
}

