import 'package:semana_profetica/app/data/helper/crud-helper.dart';

class Pedido {

  String idUsuario;
  int idTabela;
  String titulo;
  String pedido;
  String realizado;
  


  Pedido( {this.idUsuario, this.titulo, this.pedido, this.realizado} );


  Pedido.fromJson(Map<String, dynamic> json){
      this.idUsuario = json['idlogado'];
      this.idTabela = json['id'];
      this.titulo = json['titulo'];
      this.pedido = json['pedido'];
      this.realizado = json['realizado'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idTabela;
    data['idlogado'] = this.idUsuario;
    data['titulo'] = this.titulo;
    data['pedido'] = this.pedido;
    data['realizado'] = this.realizado;
    return data;
  }

  Pedido.fromMap(Map<String, dynamic> map) {
    this.idUsuario = map[CrudHelper.pedidoIdLogado];
    this.idTabela = map[CrudHelper.pedidoId];
    this.titulo = map[CrudHelper.pedidoTitulo];
    this.pedido = map[CrudHelper.pedidoPedido];
    this.realizado = map[CrudHelper.pedidoRealizado];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "idlogado": this.idUsuario,
      "id": this.idTabela,
      "titulo": this.titulo,
      "pedido": this.pedido,
      "realizado": this.realizado,
    };
    return map;
  }
}