import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsTransport.dart';
import 'package:kostqu/Models/ModelsTransport.dart';
import 'package:kostqu/Models/ModelsType.dart';
import 'package:kostqu/UI/Consumen/PeriodeSewa.dart';

class ListTransport extends StatefulWidget {
  @override
  final ModelsType type;
  ListTransport(this.type);
  _ListTransportState createState() => _ListTransportState(this.type);
}

class _ListTransportState extends State<ListTransport> {
  var loading = false;
  List<ModelsTransport> listdata = [];
  ModelsType type;
  _ListTransportState(this.type);

  Future<void> getData() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsTransport> tempData = await services.getTransport();

    setState(() {
      loading = false;
      listdata = tempData;
      print(listdata);
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
        title: 'Pilih Transport',
        backButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
            itemCount: listdata.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (listdata[index].status) {
                    Func().nav(
                        context,
                        PeriodeSewa(
                          nama: listdata[index].merek,
                          harga: 'Rp. 50.000',
                          foto: listdata[index].foto,
                        ));
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Style.colorOrange,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(Style.l(context) / 50),
                    padding: EdgeInsets.all(Style.l(context) / 50),
                    child: Row(
                      children: [
                        Container(
                          width: 110,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              image: DecorationImage(
                                  image: AssetImage(listdata[index].foto),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listdata[index].merek,
                                style: Style.textStyleParagraph(bold: true),
                              ),
                              Text(listdata[index].ukuran),
                              Text(listdata[index].warna),
                            ],
                          ),
                        ),
                        Expanded(
                            child: listdata[index].status
                                ? Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ))
                      ],
                    )),
              );
            }),
      ),
    ));
  }
}
