import 'package:flutter/material.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.white,
          navigateAfterSeconds: Routes.LOGIN,
          loaderColor: Colors.transparent,
        ),
        Container(
          margin: EdgeInsets.all(140),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo-preta.png"), fit:BoxFit.contain)
            )
          )
      ],
    );
  }
}