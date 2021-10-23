import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/Models/ModelsTransport.dart';
import 'package:kostqu/UI/Owner/Master/DetailKamar.dart';
import 'package:kostqu/UI/Owner/Master/TambahKamar.dart';
import 'package:kostqu/UI/Owner/Master/TambahSepeda.dart';

class ListMaster extends StatefulWidget {
  final String typeMaster;
  ListMaster(this.typeMaster);
  _ListMasterState createState() => _ListMasterState(this.typeMaster);
}

class _ListMasterState extends State<ListMaster> {
  String typeMaster;

  _ListMasterState(this.typeMaster);

  var loading = false;
  List<ModelsKamar> listKamar = [];
  List<ModelsTransport> listTransport = [];

  Future<void> getKamar() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsKamar> tempKamar = await services.getKamar();

    setState(() {
      loading = false;
      listKamar = tempKamar;
    });
  }

  Future<void> getTransport() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsTransport> tempData = await services.getTransport();

    setState(() {
      loading = false;
      listTransport = tempData;
    });
  }

  @override
  void initState() {
    super.initState();
    if (typeMaster == 'Kamar') {
      getKamar();
    } else {
      getTransport();
    }
  }

  @override
  Widget build(BuildContext context) {
    var list = [];
    typeMaster == 'Kamar' ? list = listKamar : list = listTransport;
    return Container(
      child: Scaffold(
        appBar: TopBar(
          backButton: true,
          isUser: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Text(
                  typeMaster,
                  style: Style.textStyleHeader1(
                    fontColor: Style.colorBlue,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            if (typeMaster == 'Kamar') {
                              Func().nav(context, DetailKamar(list[index]));
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Style.colorBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.symmetric(
                                  vertical: Style.l(context) / 50),
                              padding: EdgeInsets.all(Style.l(context) / 50),
                              child: Row(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Style.colorBlue,
                                        image: DecorationImage(
                                            image: AssetImage(list[index].foto),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].nama,
                                          style: Style.textStyleHeader3(
                                              bold: true,
                                              fontColor: Style.colorOrange),
                                        ),
                                        Text(
                                          typeMaster != 'Kamar'
                                              ? list[index].ukuran
                                              : list[index].harga,
                                          style: Style.textStyleParagraph(
                                              fontColor: Style.colorOrange),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: list[index].status
                                          ? Icon(
                                              Icons.circle,
                                              color: Style.colorBlue,
                                            )
                                          : Icon(
                                              Icons.circle,
                                              color: Style.colorBlue,
                                            ))
                                ],
                              )),
                        );
                      }),
                )
              ],
            )),
        floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Style.colorOrange)),
          onPressed: () {
            if (typeMaster == 'Kamar') {
              Func().nav(context, TambahKamar());
            } else {
              Func().nav(context, TambahSepeda());
            }
          },
          child: Text(
            '+ Tambah ' + typeMaster,
            style: Style.textStyleHeader3(fontColor: Style.colorBlue),
          ),
        ),
      ),
    );
  }
}
