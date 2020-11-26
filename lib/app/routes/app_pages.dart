import 'package:get/get.dart';
import 'package:semana_profetica/app/bindings/home_binding.dart';
import 'package:semana_profetica/app/bindings/initial_binding.dart';
import 'package:semana_profetica/app/bindings/pedidos_binding.dart';
import 'package:semana_profetica/app/bindings/user_binding.dart';
import 'package:semana_profetica/app/ui/android/decretos/decretos_page.dart';
import 'package:semana_profetica/app/ui/android/home/home_page.dart';
import 'package:semana_profetica/app/ui/android/comuns/initial_page.dart';
import 'package:semana_profetica/app/ui/android/pedidos/pedido-outra-page.dart';
import 'package:semana_profetica/app/ui/android/pedidos/pedidos_page.dart';
import 'package:semana_profetica/app/ui/android/usuario/cadastro_page.dart';
import 'package:semana_profetica/app/ui/android/usuario/login_page.dart';
import 'package:semana_profetica/app/ui/android/usuario/perfil_page.dart';

import 'app_routes.dart';

class AppPages{
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialPage(), binding: InitialBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: UserBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.DECRETOS, page: () => DecretosPage()),
    GetPage(name: Routes.REGISTER, page: () => CadastroPage(), binding: UserBinding()),
    GetPage(name: Routes.PERFIL, page: () => PerfilPage(), binding: UserBinding()),
    GetPage(name: Routes.PEDIDOS, page: () => Pedidos(), binding: PedidoBinding()),
    GetPage(name: Routes.PEDIDOSOUTROS, page: () => PedidosOutros(), binding: PedidoBinding()),
  ];
}