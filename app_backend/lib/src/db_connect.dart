//arquivo para conexão com banco de dados

import 'package:fluent_query_builder/fluent_query_builder.dart';

DbLayer db;

//configura a conexão com postgresql
final DBConnectionInfo postgresqlConfig = DBConnectionInfo(
  driver: ConnectionDriver.pgsql,
  host: 'localhost',
  database: 'teste',
  port: 5432,
  username: 'teste',
  password: '123456',
  charset: 'utf8',
  schemes: ['app'],
);


void dbConnect() async {
   if (db == null) {
    db = await DbLayer().connect(postgresqlConfig);
    print('db_connect.dart postgresql localhost $db');
  }

}
