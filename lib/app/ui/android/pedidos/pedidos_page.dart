import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/controller/home_controller.dart';
import 'package:semana_profetica/app/controller/pedido_controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:semana_profetica/app/data/model/pedido-model.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import '../comuns/cabecalho.dart';
import '../comuns/rodape.dart';

class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  //List _listaPedidos = [];
  List<Pedido> _listaPedidos = List<Pedido>();
  final PedidoController _pedidoController = Get.find();
  final String nomePedido = Get.arguments;
  final HomeController _homeController = Get.find();

  SpeedDial buildSpeedDial(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),

      marginBottom: MediaQuery.of(context).size.height / 6,
      backgroundColor: Colors.black,
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.blueAccent,
          onTap: () => Get.defaultDialog(
            title: "Semana Profética",
            onConfirm: () {
              salvarPedido();
              Get.back();
            },
            onCancel: () {},
            textConfirm: "Adicionar",
            textCancel: "Cancelar",
            content: Column(
              children: [
                TextField(
                  controller: _pedidoController.pedidoTextController,
                  decoration: InputDecoration(labelText: "Informe o pedido"),
                ),
              ],
            ),
          ),
          label: 'Adicionar',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.blueAccent,
        ),
        SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.grey,
            onTap: (){
              Get.offAndToNamed(Routes.PEDIDOSOUTROS, arguments: nomePedido);
            },
            label: 'Pedir para alguém',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.grey),
      ],
    );
  }

  recuperarPedidos() async{
    print("Como está "+nomePedido);
    List pedidosRecuperados =  await _pedidoController.carregarPedidos(_homeController.user.id, nomePedido);
    List<Pedido> listaTemporaria = List<Pedido>();

    for( var item in pedidosRecuperados)
    {
      //Pedido pedido = Pedido.fromMap( item);
       Pedido pedido = Pedido(id: item.id, pedido: item.pedido, titulo: item.titulo, realizado: item.realizado);
       listaTemporaria.add(pedido);
    }

    setState(() {
      _listaPedidos = listaTemporaria;
    });
    listaTemporaria = null;

  }


  @override
  void initState() {
    super.initState();
    recuperarPedidos();
  }

  salvarPedido() {
    String textoDigitado = _pedidoController.pedidoTextController.text;

    Pedido novoPedido = new Pedido(
      id: _homeController.user.id,
      titulo: nomePedido,
      pedido: textoDigitado,
      realizado: "false", 
    );

     _pedidoController.cadastrar(novoPedido);
     recuperarPedidos();
    //_pedidoController.carregarPedidos();
    _pedidoController.pedidoTextController.text = "";
  }

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
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Pedidos - " + nomePedido,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _listaPedidos.length,
                              itemBuilder: (context, index) {
                                final pedido = _listaPedidos[index];
                                bool valor;
                                if(pedido.realizado == "true"){
                                  valor = true;
                                }
                                else if (pedido.realizado == "false"){
                                  valor = false;
                                } 
                                print("Realizado "+pedido.realizado);        
                                return CheckboxListTile(
                                  activeColor: Colors.black,
                                  title: Text(
                                    pedido.pedido,
                                  ),
                                  value: valor,
                                  onChanged: (value) {
                                    setState(() {   
                                      print("teste "+value.toString());
                                      pedido.realizado = value.toString();
                                    });
                                  },
                                );
                              }),
                        ),
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
      floatingActionButton: buildSpeedDial(context),
    );
  }
}

