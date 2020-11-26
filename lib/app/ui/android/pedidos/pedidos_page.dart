import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/controller/pedido_controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import '../comuns/cabecalho.dart';
import '../comuns/rodape.dart';

class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  List _listaPedidos = [];
  final PedidoController _pedidoController = Get.find();
  final String nomePedido = Get.arguments;
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

  salvarPedido() {
    String textoDigitado = _pedidoController.pedidoTextController.text;
    Map<String, dynamic> pedido = Map();
    pedido["titulo"] = textoDigitado;
    pedido["realizada"] = false;
    setState(() {
      _listaPedidos.add(pedido);
    });
    //   _salvarArquivo();
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
                                return CheckboxListTile(
                                  activeColor: Colors.black,
                                  title: Text(
                                    _listaPedidos[index]["titulo"],
                                  ),
                                  value: _listaPedidos[index]["realizada"],
                                  onChanged: (value) {
                                    setState(() {
                                      _listaPedidos[index]["realizada"] = value;
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

