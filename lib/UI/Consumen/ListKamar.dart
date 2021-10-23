import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostqu/Component/CRoom.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsKamar.dart';

class ListKamar extends StatefulWidget {
  @override
  _ListKamarState createState() => _ListKamarState();
}

class _ListKamarState extends State<ListKamar> {
  var loading = false;
  List<ModelsKamar> listdata = [];

  Future<void> getData() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsKamar> tempData = await services.getKamar();

    setState(() {
      loading = false;
      listdata = tempData;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(
        title: 'Pilih Kamar',
        backButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: CRoom(data: listdata),
      ),
    ));
  }
}
