import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/CItemDetail.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/bar.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/Dashboad.dart';

class Transaksi extends StatefulWidget {
  @override
  final String nama, harga, foto, checkin, checkout;

  Transaksi({this.nama, this.harga, this.foto, this.checkin, this.checkout});
  _TransaksiState createState() => _TransaksiState(
      this.nama, this.harga, this.foto, this.checkin, this.checkout);
}

class _TransaksiState extends State<Transaksi> {
  var loading = false;
  bool visibility = false;
  String nama, harga, foto, checkin, checkout;
  String _type = 'lunas';
  int _dp;
  List<String> type = ['lunas', 'Dp'];
  _TransaksiState(
    this.nama,
    this.harga,
    this.foto,
    this.checkin,
    this.checkout,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: TopBar(
              backButton: true,
              title: 'Transaksi',
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(Style.l(context) / 20),
                  margin: EdgeInsets.symmetric(
                    horizontal: Style.l(context) / 15,
                  ),
                  alignment: Alignment.center,
                  color: Colors.grey[400],
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(foto), fit: BoxFit.cover)),
                        height: Style.p(context) / 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: Style.l(context) / 15),
                        margin: EdgeInsets.symmetric(
                          horizontal: Style.l(context) / 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              nama,
                              style: Style.textStyleHeader1(bold: true),
                            ),
                            Text(
                              harga,
                              style: Style.textStyleHeader3(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Style.l(context) / 30,
                        ),
                        alignment: Alignment.center,
                        color: Style.colorOrange,
                        child: Column(
                          children: [
                            Container(
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  title: Text('Pembayaran :'),
                                  trailing: DropdownButton<String>(
                                    value: _type,
                                    icon: Icon(Icons.arrow_downward),
                                    iconSize: 12,
                                    elevation: 16,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _type = newValue;
                                      });
                                    },
                                    items: type
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )),
                            _type == 'lunas'
                                ? Text(harga)
                                : Input(
                                    type: TextInputType.number,
                                    labelStyle: Style.textStyleHeader3(),
                                    label: 'Dp',
                                    values: (value) {
                                      _dp = int.parse(value);
                                    }),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Func().navroot(
                              context,
                              ConsDashboard(
                                  nama: nama, harga: harga, foto: foto));
                        },
                        child: Text('Bayar'),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
