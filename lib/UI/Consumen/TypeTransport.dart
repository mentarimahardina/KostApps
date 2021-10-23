import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsType.dart';
import 'package:kostqu/UI/Consumen/ListTransport.dart';

class TypeTransport extends StatefulWidget {
  @override
  _TypeTransportState createState() => _TypeTransportState();
}

class _TypeTransportState extends State<TypeTransport> {
  var loading = false;
  List<ModelsType> listdata = [];

  Future<void> getData() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsType> tempData = await services.getType();

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
        title: 'Pilih Type Transport',
        backButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
            itemCount: listdata.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Style.colorOrange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.all(Style.l(context) / 30),
                child: ListTile(
                  enabled: listdata[index].status,
                  onTap: () {
                    Func().nav(context, ListTransport(listdata[index]));
                  },
                  title: Text(
                    listdata[index].nama,
                    style: Style.textStyleHeader3(fontColor: Colors.white),
                  ),
                  trailing: listdata[index].status
                      ? Text('')
                      : Text(
                          'Comming soon',
                          style:
                              Style.textStyleHeader3(fontColor: Colors.white),
                        ),
                ),
              );
            }),
      ),
    ));
  }
}
