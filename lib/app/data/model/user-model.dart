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
    imagem = json['imagem'];
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
}