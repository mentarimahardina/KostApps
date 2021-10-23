import 'package:flutter/material.dart';
import 'package:kostqu/Component/ButtonIconText.dart';
import 'package:kostqu/Component/CPromo.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/DetailSewa.dart';
import 'package:kostqu/UI/Consumen/ListKamar.dart';
import 'package:kostqu/UI/Consumen/Transaksi.dart';
import 'package:kostqu/UI/Consumen/TypeTransport.dart';

class ConsDashboard extends StatefulWidget {
  @override
  final String nama, harga, foto;

  ConsDashboard({this.nama, this.harga, this.foto});
  _ConsDashboardState createState() =>
      _ConsDashboardState(this.nama, this.harga, this.foto);
}

List listdata = [
  {
    "idRoom": 1,
    "name": "satu",
    "color": Colors.red,
  },
  {
    "idRoom": 2,
    "name": "dua",
    "color": Colors.orange,
  },
  {
    "idRoom": 3,
    "name": "tiga",
    "color": Colors.yellow,
  },
  {
    "idRoom": 4,
    "name": "empat",
    "color": Colors.green,
  },
  {
    "idRoom": 5,
    "name": "lima",
    "color": Colors.blue,
  },
  {
    "idRoom": 6,
    "name": "enam",
    "color": Colors.blueAccent,
  },
  {
    "idRoom": 7,
    "name": "tujuh",
    "color": Colors.purple,
  },
  {
    "idRoom": 5,
    "name": "lima",
    "color": Colors.blue,
  },
  {
    "idRoom": 6,
    "name": "enam",
    "color": Colors.blueAccent,
  },
  {
    "idRoom": 7,
    "name": "tujuh",
    "color": Colors.purple,
  },
];

class _ConsDashboardState extends State<ConsDashboard>
    with TickerProviderStateMixin {
  var loading = false;
  bool action2 = false;
  String nama, harga, foto;
  _ConsDashboardState(this.nama, this.harga, this.foto);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: TopBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            CPromo(
              data: listdata,
            ),
            Row(
              children: [
                nama != null
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          color: Style.colorOrange,
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              Func().nav(
                                  context,
                                  DetailSewa(
                                      nama: nama, harga: harga, foto: foto));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Style.colorOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(Style.l(context) / 50),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Style.colorOrange,
                                          image: DecorationImage(
                                              image: AssetImage(foto),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            nama,
                                            style: Style.textStyleHeader3(
                                                bold: true,
                                                fontColor: Style.colorBlue),
                                          ),
                                          Text(
                                            harga,
                                            style: Style.textStyleParagraph(
                                                fontColor: Style.colorBlue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Approved',
                                        style: Style.textStyleParagraph(
                                            fontColor: Style.colorBlue),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ))
                    : Expanded(
                        flex: 1,
                        child: ButtonIconText(
                          title: "Kamar",
                          icon: Icon(
                            Icons.hotel,
                            size: 100,
                            color: Style.colorBlue,
                          ),
                          action: () {
                            Func().nav(context, ListKamar());
                          },
                        )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
