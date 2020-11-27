import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/helper/crud-helper.dart';
import 'package:semana_profetica/app/data/model/pedido-model.dart';
import 'package:semana_profetica/app/data/repository/pedido_repository.dart';

class PedidoController extends GetxController {

final PedidoRepository repository;
PedidoController({@required this.repository}) : assert(repository != null);

final TextEditingController pedidoTextController = TextEditingController();
final TextEditingController nomeTextController = TextEditingController();


List<Pedido> pedidos  = List<Pedido>() .obs;


  @override
  void onInit() {
    // É a mesma coisa que initState()
    super.onInit();

  }


  cadastrar(Pedido pedido) async {
     await repository.cadastrar(pedido);
    // print("Controller " + pedido.id + "titulo "+ pedido.titulo + "pedido "+pedido.pedido + "realizado "+pedido.realizado );
  }

  carregarPedidos(String idusuario, String titulo) async {
    
    List<Map> pedidosRecuperados = await repository.carregarPedidos(idusuario, titulo);
    List<Pedido> listaTemporaria = List<Pedido>();

    for (var item in pedidosRecuperados) {
        Pedido pedido = Pedido.fromMap(item);
        listaTemporaria.add(pedido);
      }
     return listaTemporaria;
 
  }
      

  
}