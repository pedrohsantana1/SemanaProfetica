import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import 'package:semana_profetica/app/ui/android/home/home_page.dart';

import '../decretos/decretos_page.dart';


class Rodape extends StatefulWidget {
  
  @override
  _RodapeState createState() => _RodapeState();
}

class _RodapeState extends State<Rodape> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height / 30,
      //bottom: 100,
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: <Widget>[
                Positioned(
                  //bottom: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 65,
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                //  Navigator.pop(context);
                               //  Navigator.push(context,MaterialPageRoute(builder: (context)=> Decretos()));
                                  Get.toNamed(Routes.DECRETOS);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.book,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Decretos",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 65,
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                 // Navigator.pop(context);
                                 // Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
                                  Get.toNamed(Routes.HOME);Get.toNamed(Routes.HOME);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.home,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Início",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 65,
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                  Get.toNamed(Routes.OFERTAS);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Ofertas",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
