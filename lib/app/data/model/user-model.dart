import 'package:semana_profetica/app/data/helper/crud-helper.dart';

class Usuario {
  String id;
  String nome;
  String email;
  String senha;
  String endereco;
  String dataAniversario;
  String telefone;
  String imagem;

  Usuario(
      {
      this.id,
      this.nome,
      this.email,
      this.senha,
      this.endereco,
      this.dataAniversario,
      this.telefone,
      this.imagem
      });

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    endereco = json['endereco'];
    dataAniversario = json['data_aniversario'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    data['dataAniversario'] = this.dataAniversario;
    data['telefone'] = this.telefone;
    return data;
  }

  Usuario.fromMap(Map map) {
    this.id = map[CrudHelper.usuarioIdLogado];
    this.nome = map[CrudHelper.usuarioNome];
    this.email = map[CrudHelper.usuarioEmail];
    this.senha = map[CrudHelper.usuarioSenha];
    this.endereco = map[CrudHelper.usuarioEndereco];
    this.dataAniversario = map[CrudHelper.usuarioData];
    this.telefone = map[CrudHelper.usuarioTelefone];

  }

  Map toMap() {
    Map<String, dynamic> map = {
      "idlogado": this.id,
      "nome": this.nome,
      "email": this.email,
      "senha": this.senha,
      "endereco": this.endereco,
      "data": this.dataAniversario,
      "telefone": this.telefone,
    };
    return map;
  }
}
