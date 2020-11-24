import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:semana_profetica/app/bindings/teste_binding.dart';
import 'package:semana_profetica/app/routes/app_pages.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import 'package:semana_profetica/app/ui/theme/app_theme.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: 'Semana Profética',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,

    ));

}


