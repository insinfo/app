import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:app_frontend/src/models/pessoa.dart';
//esta lib é para fazer a conexão com o backend via AJAX
//este "as http" é um apelido que voçê pode dar a uma lib
import 'package:http/http.dart' as http;
import 'dart:html';

@Component(selector: 'pagina1', templateUrl: 'pagina1.html', styleUrls: [
  'pagina1.css'
], directives: [
  coreDirectives,
  formDirectives,
])
class Pagina1 {
  Pessoa pessoa = Pessoa();

  void salvar() async {
    //salva pessoa no banco atraves do backend MVC
    await http.post('http://localhost:3000/pessoas',
        body: jsonEncode(pessoa.toMap()),
        headers: {'Content-Type': 'application/json;charset=utf-8'});

    window.alert('Salvo');
  }
}
