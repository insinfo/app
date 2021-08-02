//este aquivo é como se fosse o index.php é aqui que fica as configurações de inicialização do framework Angel
library app_backend;
//estes import é como se fosse o include do PHP 
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/local.dart';
import 'package:angel_configuration/angel_configuration.dart';
import 'db_connect.dart';
import 'routes.dart' as routes;

Future configureServer(Angel app) async {
  //configura o angel para funcionar com CORS Cross-Origin Resource Sharing ou CORS é um mecanismo que permite que recursos restritos em uma página da web sejam recuperados por outro domínio fora do domínio ao qual pertence o recurso que será recuperado.
   app.fallback(cors());
  //conexão com o banco de dados
  await dbConnect();

  // configura o Angel para servir arquivos estaticos
  const fs = LocalFileSystem();
  //file system config
  await app.configure(configuration(fs));

  //configura as rotas 
  await app.configure(routes.configureServer(fs));
}

