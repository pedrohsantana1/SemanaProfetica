import 'package:flutter/material.dart';

import '../comuns/cabecalho.dart';
import '../comuns/rodape.dart';



class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  List _listaPedidos = [];
  TextEditingController _controllerPedido = TextEditingController();

  _salvarPedido() {
    String textoDigitado = _controllerPedido.text;
    Map<String, dynamic> pedido = Map();
    pedido["titulo"] = textoDigitado;
    pedido["realizada"] = false;
    setState(() {
      _listaPedidos.add(pedido);
    });
    //   _salvarArquivo();
    _controllerPedido.text = "";
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
                  //color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: ListView(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Pedidos",
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
                                    title: Text(_listaPedidos[index]["titulo"],),
                                    value: _listaPedidos[index]["realizada"],
                                    onChanged: (value) {
                                      setState(() {
                                        _listaPedidos[index]["realizada"] =
                                            value;
                                      });
                                    },
                                  );
                                }))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 6,
                  right: MediaQuery.of(context).size.width / 8,
                  child: FloatingActionButton(
                      mini: false,
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.black,
                      child: Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Adicionar pedido"),
                                content: TextField(
                                  controller: _controllerPedido,
                                  decoration: InputDecoration(
                                      labelText: "Digite seu pedido"),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Cancelar"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("Salvar"),
                                    onPressed: () {
                                      _salvarPedido();
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }),
                ),
                Rodape()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
