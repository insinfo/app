//este aquivo é que sera executado de fato ||| este é o como index.php de fato
import 'dart:io';import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';
import 'package:app_backend/src/pretty_logging.dart';
import 'package:logging/logging.dart';
import 'package:app_backend/src/boot_angel.dart';

dynamic main() async {
  //isto é para facilitar o desenvolvimento, o HotReloader é um recurso que permite o auto recarregamento do backend
  //quando voce altera o o codigo
  final hot = HotReloader(() async {
    final logger = Logger.detached('ro_app_server')
      ..level = Level.ALL
      //prettyLog é para embelezar o log
      ..onRecord.listen(prettyLog);
    final app = Angel(logger: logger);
    await app.configure(configureServer);
    return app;
  }, [
    //pastas a serem monitoradas
    Directory('lib'),   
  ]);

  //ip e porta que vai rodar o backend //e como você configurar o Apache pro PHP so que em apenas uma linha de codigo 
  await hot.startServer('localhost', 3000);
  print('startServer on http://localhost:3000');
}
