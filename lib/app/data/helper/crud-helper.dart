import 'package:semana_profetica/app/data/model/pedido-model.dart';
import 'package:semana_profetica/app/data/model/pedido-outra-model.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CrudHelper {
  static final CrudHelper _crudHelper = CrudHelper._internal();
  Database _db;

  //Tabela Usuario
  static final String usuarioTabela = "usuario";
  static final String usuarioId = "id";
  static final String usuarioIdLogado = "idlogado";
  static final String usuarioNome = "nome";
  static final String usuarioEmail = "email";
  static final String usuarioSenha = "senha";
  static final String usuarioEndereco = "endereco";
  static final String usuarioData = "data";
  static final String usuarioTelefone = "telefone";
  
  //Tabela Pedidos
  static final String pedidoTabela = "pedido";
  static final String pedidoId = "id";
  static final String pedidoIdLogado = "idlogado";
  static final String pedidoTitulo = "titulo";
  static final String pedidoPedido = "pedido";
  static final String pedidoRealizado = "realizado";
  
  //Tabela PedidosOutra
  static final String pedidoOutraTabela = "pedidoOutra";
  static final String pedidoOutraId = "id";
  static final String pedidoOutraIdLogado = "idlogado";
  static final String pedidoOutraTitulo = "titulo";
  static final String pedidoOutraPedido = "pedido";
  static final String pedidoOutraRealizado = "realizado";

  factory CrudHelper(){
    return _crudHelper;
  }


  CrudHelper._internal(){}


  get db async
  {
   // print('db: '+db.toString());
    if( _db   != null)
    {

      return _db;
    }
    else
    {

      _db = await inicializarDB();

      return _db;
    }
  }

  inicializarDB() async{

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_semana.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{


    String tabelaUsuario = "CREATE TABLE $usuarioTabela ($usuarioId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "$usuarioIdLogado	VARCHAR(40) NOT NULL,"
        "$usuarioNome	VARCHAR(40) NOT NULL,"
        "$usuarioEmail	VARCHAR(40) NOT NULL,"
        "$usuarioSenha	VARCHAR(40) NOT NULL,"
        "$usuarioEndereco	VARCHAR(40) NOT NULL,"
        "$usuarioData	VARCHAR(40) NOT NULL,"
        "$usuarioTelefone VARCHAR(40))";

    String tabelaPedido = "CREATE TABLE $pedidoTabela ($pedidoId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "$pedidoIdLogado	VARCHAR(40) NOT NULL,"
        "$pedidoTitulo	VARCHAR(40) NOT NULL,"
        "$pedidoPedido	VARCHAR(40) NOT NULL,"   
        "$pedidoRealizado	VARCHAR(40) NOT NULL )";

    String tabelaPedidoOutra = "CREATE TABLE $pedidoOutraTabela ($pedidoOutraId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "$pedidoOutraIdLogado	VARCHAR(40) NOT NULL,"
        "$pedidoOutraTitulo	VARCHAR(40) NOT NULL,"
        "$pedidoOutraPedido	VARCHAR(40) NOT NULL,"   
        "$pedidoOutraRealizado	VARCHAR(40) NOT NULL )";

     await db.execute(tabelaUsuario);
     await db.execute(tabelaPedido);
     await db.execute(tabelaPedidoOutra);

  }

//Tabela Usuário
  Future<int> salvarUsuario(Usuario user) async{

    var bancoDados = await db;
    int resultado = await bancoDados.insert(usuarioTabela, user.toMap());
    print("Banco "+resultado.toString());
    return resultado;
  }


  recuperarUsuario() async{

    var bancoDados = await db;
    String sql = "SELECT * FROM $usuarioTabela";
    List usuarios = await bancoDados.rawQuery(sql);
    return usuarios;
  }

  excluirUsuario() async{
    var bancoDados = await db;
    return await bancoDados.delete(
        usuarioTabela,
    );
  }

  //Tabela Pedido
  Future<int> salvarPedido(Pedido pedido) async{

    var bancoDados = await db;
    int resultado = await bancoDados.insert(pedidoTabela, pedido.toMap());
    print("Banco Pedido Normal"+resultado.toString());
    return resultado;
  }

  recuperarPedido(String idusuario, String titulo) async{

    var bancoDados = await db;
    String sql = 'SELECT * FROM $pedidoTabela WHERE $pedidoIdLogado = "$idusuario" AND $pedidoTitulo = "$titulo"';

    List pedidos = await bancoDados.rawQuery(sql);
    return pedidos;
  }

  Future<int> atualizarPedido(Pedido pedido) async{
    var bancoDados = await db;
    int retorno = await bancoDados.rawUpdate(
      '''
        UPDATE $pedidoTabela 
        SET pedido = ? 
        WHERE $pedidoIdLogado = ? AND $pedidoTitulo = ? AND $pedidoId = ?
        ''', 
        [pedido.pedido, pedido.idUsuario, pedido.titulo, pedido.idTabela]
    );

    return retorno;

  }

Future<int> excluirPedido(Pedido pedido) async{
    var bancoDados = await db;
    return await bancoDados.delete(
        pedidoTabela,
        where: "$pedidoId = ?",
        whereArgs: [pedido.idTabela]
    );
  }

//Tabela Pedido Outra
  Future<int> salvarPedidoOutra(PedidoOutra pedido) async{

    var bancoDados = await db;
    int resultado = await bancoDados.insert(pedidoOutraTabela, pedido.toMap());
    print("Banco Pedido Outra"+resultado.toString());
    return resultado;
  }

  recuperarPedidoOutra(String idusuario, String titulo) async{

    var bancoDados = await db;
    String sql = 'SELECT * FROM $pedidoOutraTabela WHERE $pedidoOutraIdLogado = "$idusuario" AND $pedidoOutraTitulo = "$titulo"';

    List pedidos = await bancoDados.rawQuery(sql);
    return pedidos;
  }

  Future<int> atualizarPedidoOutra(PedidoOutra pedido) async{
    var bancoDados = await db;
    int retorno = await bancoDados.rawUpdate(
      '''
        UPDATE $pedidoOutraTabela 
        SET pedido = ? 
        WHERE $pedidoOutraIdLogado = ? AND $pedidoOutraTitulo = ? AND $pedidoOutraId = ?
        ''', 
        [pedido.pedido, pedido.idUsuario, pedido.titulo, pedido.idTabela]
    );

    return retorno;

  }


Future<int> excluirPedidoOutra(PedidoOutra pedido) async{
    var bancoDados = await db;
    return await bancoDados.delete(
        pedidoOutraTabela,
        where: "$pedidoOutraId = ?",
        whereArgs: [pedido.idTabela]
    );

  }
}