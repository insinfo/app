import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:app_frontend/src/models/pessoa.dart';
import 'package:http/http.dart' as http;

@Component(selector: 'pagina2', templateUrl: 'pagina2.html', styleUrls: [
  'pagina2.css'
], directives: [
  coreDirectives,
  formDirectives,
])
class Pagina2 implements OnInit {
  List<Pessoa> pessoas = <Pessoa>[];

  @override
  void ngOnInit() async {
    //obtem os dados do backend
    var resp = await http.get('http://localhost:3000/pessoas');
    //decodifica o JSON
    var dados = jsonDecode(resp.body) as List;
    //converte o JSON para lista de Pessoas
    dados.forEach((item) {
      pessoas.add(Pessoa.fromMap(item));
    });
  }
}
