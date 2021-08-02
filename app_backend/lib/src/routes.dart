//este aquivo é para definir as rotas de backend

import 'package:angel_framework/angel_framework.dart';
import 'package:app_backend/src/controllers/pessoa_controller.dart';
import 'package:file/file.dart';

///arquivo de rotas
AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    //exemplo de uma rota raiz do tipo GET que pode ser acessada pelo frontend via AJAX
    app.get('/', (req, res) => res.write('app backend '));

    //esta rota sera utilizada para cadastrar pessoa no banco de dados
    app.post('/pessoas', (req, res) => PessoaController.cadastrar);
    //rota para listar pessoas
    app.get('/pessoas', (req, res) => PessoaController.listar);
  };
}
