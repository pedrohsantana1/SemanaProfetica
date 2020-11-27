import 'package:semana_profetica/app/data/helper/crud-helper.dart';

class Pedido {

  String id;
  String titulo;
  String pedido;
  String realizado;
  


  Pedido({ this.id, this.titulo, this.pedido, this.realizado });


  Pedido.fromJson(Map<String, dynamic> json){
      this.id = json['idlogado'];
      this.titulo = json['titulo'];
      this.pedido = json['pedido'];
      this.realizado = json['realizado'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idlogado'] = this.id;
    data['titulo'] = this.titulo;
    data['pedido'] = this.pedido;
    data['realizado'] = this.realizado;
    return data;
  }

  Pedido.fromMap(Map map) {
    this.id = map[CrudHelper.pedidoIdLogado];
    this.titulo = map[CrudHelper.pedidoTitulo];
    this.pedido = map[CrudHelper.pedidoPedido];
    this.realizado = map[CrudHelper.pedidoRealizado];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "idlogado": this.id,
      "titulo": this.titulo,
      "pedido": this.pedido,
      "realizado": this.realizado,
    };
    return map;
  }
}