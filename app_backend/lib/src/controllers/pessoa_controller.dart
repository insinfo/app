//esta class serve para vincular a rota de cadastro de pessoa
import 'dart:convert';
import 'package:angel_framework/angel_framework.dart';
import 'package:app_backend/src/models/pessoa.dart';
import 'package:app_backend/src/repositories/pessoa_repository.dart';

class PessoaController {
  static cadastrar(RequestContext req, ResponseContext res) async {
    //obtem os dados que vem do frontend via AJAX
    await req.parseBody();
    var dados = await req.bodyAsMap;
    print(dados);
    PessoaRepository().cadastrar(Pessoa.fromMap(dados));
    //define o tipo de reposta para json para que o frontend receba via Ajax
    res.headers['Content-Type'] = 'application/json;charset=utf-8';
    //converte do tipo Map para String JSON e retorna para o frontend via Ajax
    res.write(jsonEncode({'message': 'sucesso'}));
  }

  static listar(RequestContext req, ResponseContext res) async {
    var pessoas = await PessoaRepository().listar();
    res.headers['Content-Type'] = 'application/json;charset=utf-8';
    res.write(jsonEncode(pessoas));
  }
}
