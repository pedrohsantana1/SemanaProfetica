class Pedido {

  String id;
  String titulo;
  String pedido;
  String realizado;
  


  Pedido({ id, titulo, pedido, realizado });


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
}