import 'package:app_backend/src/models/pessoa.dart';
import 'package:app_backend/src/db_connect.dart';

class PessoaRepository {
  PessoaRepository();
  // a palavra async significa que esta função é assincrona e que quero usar 
  // funções assincronas dentro dela, a função exec() é assincrona
  void cadastrar(Pessoa pessoa) async {
    //esta unica linha salva no banco a pessoa
    //isso pode ser feito desta forma ou
   // await db.insert().into('pessoas').setAll(pessoa.toMap()).exec();

    //desta
    var query = db.insert();
    query.into('pessoas');
    query.setAll(pessoa.toMap());

    //executa a query no banco

    //a palavra await significa aguarde o operação ser concluida
    await query.exec();
  }

  //este metodo var listar todas as pessoas que esta no banco
  //Future é por conta que esta operação é assincrona
  Future<List<Map<String, dynamic>>> listar() async {
    return await db.select().from('pessoas').getAsMap();
  }
}
