import 'dart:convert';

import 'package:angel3_framework/angel3_framework.dart';
import 'package:logging/logging.dart';
import 'package:angel3_hot/angel3_hot.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

void main() async {
  var hot = new HotReloader(createServer, ['bin/main.dart']);
  await hot.startServer('127.0.0.1', 3000);
}

Future<Angel> createServer() async {
  var app = Angel();

  Db db = Db('mongodb://localhost:27017/Esteglal');
  await db.open();
  app.logger = Logger('mamad')
    ..onRecord.listen((req) {
      print('req');
    });
  var uuid = Uuid();
  print('server running');
  app.get('/', (req, res) {
    res.write(jsonEncode({'you are at home': 'hello'}));
  });
  return app;
}
