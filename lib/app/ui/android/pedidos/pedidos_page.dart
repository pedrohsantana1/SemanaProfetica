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
            onTap: () {
              Get.offAndToNamed(Routes.PEDIDOSOUTROS, arguments: nomePedido);
            },
            label: 'Pedir para alguém',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.grey),
      ],
    );
  }

  recuperarPedidos() async {
    List pedidosRecuperados = await _pedidoController.carregarPedidos(
        _homeController.user.id, nomePedido);

    setState(() {
      _listaPedidos = pedidosRecuperados;
    });

  }

  @override
  void initState() {
    super.initState();
    recuperarPedidos();
  }

  salvarPedido() {
    String textoDigitado = _pedidoController.pedidoTextController.text;
    Pedido novoPedido = new Pedido(
      idUsuario: _homeController.user.id,
      titulo: nomePedido,
      pedido: textoDigitado,
      realizado: "false",
    );

    _pedidoController.cadastrar(novoPedido);
    recuperarPedidos();
    //_pedidoController.carregarPedidos();
    _pedidoController.pedidoTextController.text = "";
  }

  atualizarPedido(Pedido pedido) {
    String textoDigitado = _pedidoController.pedidoTextController.text;
    
    pedido.idUsuario = _homeController.user.id;
    pedido.titulo =  nomePedido;
    pedido.pedido =  textoDigitado;
    pedido.realizado = "false";
  
    _pedidoController.atualizar(pedido);
    recuperarPedidos();
    //_pedidoController.carregarPedidos();
    _pedidoController.pedidoTextController.text = "";
  }

  void CaixaDialogo(String texto, Pedido pedido) {
    Get.defaultDialog(
      title: "Semana Profética",
      onConfirm: () {
        atualizarPedido(pedido);
        Get.back();
      },
      onCancel: () {},
      textConfirm: texto,
      textCancel: "Cancelar",
      content: Column(
        children: [
          TextField(
            controller: _pedidoController.pedidoTextController,
            decoration: InputDecoration(labelText: "Informe o pedido"),
          ),
        ],
      ),
    );
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
                    child: Column(
                      //shrinkWrap: true,
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
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1.8,
                            child: ListView.builder(
                              itemCount: _listaPedidos.length,
                              itemBuilder: (context, index) {
                                final pedido = _listaPedidos[index];
                                bool valor;
                                if (pedido.realizado == "true") {
                                  valor = true;
                                } else if (pedido.realizado == "false") {
                                  valor = false;
                                }
                                return Dismissible(
                                  key: Key(DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString()),
                                  //direction: DismissDirection.endToStart,
                                  //  direction: DismissDirection.,
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      CaixaDialogo("Atualizar", pedido);
                                    } else if (direction ==
                                        DismissDirection.startToEnd) {
                                      _pedidoController.excluir(pedido);
                                    }
                                  },

                                  background: Container(
                                    color: Colors.red,
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.blue,
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    activeColor: Colors.black,
                                    title: Text(
                                      pedido.pedido,
                                    ),
                                    value: valor,
                                    onChanged: (value) {
                                      setState(() {
                                        print("teste " + value.toString());
                                        pedido.realizado = value.toString();
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
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
