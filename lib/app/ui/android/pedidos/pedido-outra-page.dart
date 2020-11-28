import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/controller/home_controller.dart';
import 'package:semana_profetica/app/controller/pedido-outra-controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:semana_profetica/app/data/model/pedido-outra-model.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';
import '../comuns/cabecalho.dart';
import '../comuns/rodape.dart';

class PedidosOutra extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<PedidosOutra> {
  //List _listaPedidos = [];
  List<PedidoOutra> _listaPedidos = List<PedidoOutra>();
  final PedidoOutraController _pedidoController = Get.find();
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
                  controller: _pedidoController.texto,
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
            child: Icon(Icons.arrow_back, color: Colors.white),
            backgroundColor: Colors.grey,
            onTap: () =>
                Get.offAndToNamed(Routes.PEDIDOS, arguments: nomePedido),
            label: 'Voltar',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.grey),
        SpeedDialChild(
            child: Icon(Icons.monetization_on, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () {
              Get.offAndToNamed(
                Routes.OFERTAS,
              );
            },
            label: 'Dízimo / Oferta',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.green),
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
    String textoDigitado = _pedidoController.texto.text;
    PedidoOutra novoPedido = new PedidoOutra(
      idUsuario: _homeController.user.id,
      titulo: nomePedido,
      pedido: textoDigitado,
      realizado: "false",
    );

    _pedidoController.cadastrar(novoPedido);
    recuperarPedidos();
    //_pedidoController.carregarPedidos();
    _pedidoController.texto.text = "";
  }

  atualizarPedido(PedidoOutra pedido, String verifica) {
    String textoDigitado = _pedidoController.texto.text;
    
    if(verifica == "1"){
      pedido.pedido =  textoDigitado;
    }
    else{
      pedido.pedido =  pedido.pedido;
    }
    pedido.idUsuario = _homeController.user.id;
    pedido.titulo =  nomePedido;
    pedido.realizado = pedido.realizado;

    print("OK: "+pedido.realizado);

    _pedidoController.atualizar(pedido);
    recuperarPedidos();
    //_pedidoController.carregarPedidos();
    _pedidoController.texto.text = "";
  }

  void CaixaDialogo(String texto, PedidoOutra pedido) {
    Get.defaultDialog(
      title: "Semana Profética",
      onConfirm: () {
        atualizarPedido(pedido, "1");
        Get.back();
      },
      onCancel: () {},
      textConfirm: texto,
      textCancel: "Cancelar",
      content: Column(
        children: [
          TextField(
            controller: _pedidoController.texto,
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
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Pedidos para outros",
                            style: TextStyle(
                              fontSize: 15,
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
                                        atualizarPedido(pedido, "0");
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
