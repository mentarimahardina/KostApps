import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostqu/Models/ModelsMaster.dart';
import 'package:kostqu/Models/ModelsPembayaran.dart';
import 'package:kostqu/Models/ModelsSewa.dart';
import 'package:kostqu/Models/ModelsTransport.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kostqu/Models/ModelsType.dart';
import 'package:kostqu/Models/ModelsUser.dart';

class Services {
  final BuildContext context;

  Services({@required this.context});

  Future<List<ModelsKamar>> getKamar() async {
    Future<String> kamar = rootBundle.loadString('assets/json/kamar.json');
    Map<String, dynamic> map = json.decode(await kamar);
    var data = map['Data'];
    List<ModelsKamar> list = [];
    for (var item in data) {
      list.add(ModelsKamar.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsType>> getType() async {
    Future<String> type =
        rootBundle.loadString('assets/json/TypeTransport.json');
    Map<String, dynamic> map = json.decode(await type);
    var data = map['Data'];
    List<ModelsType> list = [];
    for (var item in data) {
      list.add(ModelsType.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsTransport>> getTransport() async {
    Future<String> transport = rootBundle.loadString('assets/json/sepeda.json');

    Map<String, dynamic> map = json.decode(await transport);
    var data = map['Data'];
    List<ModelsTransport> list = [];
    for (var item in data) {
      list.add(ModelsTransport.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsMaster>> getDataMaster() async {
    Future<String> transport =
        rootBundle.loadString('assets/json/DataMaster.json');

    Map<String, dynamic> map = json.decode(await transport);
    var data = map['Data'];
    List<ModelsMaster> list = [];
    for (var item in data) {
      list.add(ModelsMaster.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsPembayaran>> getDataPembayaran() async {
    Future<String> transport =
        rootBundle.loadString('assets/json/DataPembayaran.json');

    Map<String, dynamic> map = json.decode(await transport);
    var data = map['Data'];
    List<ModelsPembayaran> list = [];
    for (var item in data) {
      list.add(ModelsPembayaran.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsSewa>> getDataSewa() async {
    Future<String> transport =
        rootBundle.loadString('assets/json/DataSewa.json');

    Map<String, dynamic> map = json.decode(await transport);
    var data = map['Data'];
    List<ModelsSewa> list = [];
    for (var item in data) {
      list.add(ModelsSewa.fromJson(item));
    }
    return list;
  }

  Future<List<ModelsUser>> getDataUser() async {
    Future<String> transport =
        rootBundle.loadString('assets/json/DataUser.json');

    Map<String, dynamic> map = json.decode(await transport);
    var data = map['Data'];
    List<ModelsUser> list = [];
    for (var item in data) {
      list.add(ModelsUser.fromJson(item));
    }
    return list;
  }
}
