import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/CItemDetail.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/PeriodeSewa.dart';

class TambahSepeda extends StatefulWidget {
  @override
  _TambahSepedaState createState() => _TambahSepedaState();
}

class _TambahSepedaState extends State<TambahSepeda> {
  final _formKey = GlobalKey<FormState>();

  String _nama, _harga, _ukuran, _kmandi, _kasur, _ac, _meja;
  var loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        isUser: true,
        backButton: true,
        title: 'Tambah Transport',
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                  height: Style.p(context) / 6,
                  width: Style.l(context) / 4,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Input(
                          type: TextInputType.text,
                          labelStyle: Style.textStyleHeader3(),
                          label: 'Nama',
                          values: (value) => _nama = value),
                      Input(
                          type: TextInputType.text,
                          labelStyle: Style.textStyleHeader3(),
                          label: 'Merk',
                          values: (value) => _harga = value),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(Style.l(context) / 15),
            alignment: Alignment.center,
            color: Colors.grey[300],
            child: Column(
              children: [
                Input(
                    type: TextInputType.text,
                    labelStyle: Style.textStyleHeader3(),
                    label: 'No Rangka',
                    values: (value) => _ukuran = value),
                Input(
                    type: TextInputType.text,
                    labelStyle: Style.textStyleHeader3(),
                    label: 'Warna',
                    values: (value) => _kmandi = value),
                Input(
                    type: TextInputType.text,
                    labelStyle: Style.textStyleHeader3(),
                    label: 'Ukuran',
                    values: (value) => _kasur = value),
                Input(
                    type: TextInputType.text,
                    labelStyle: Style.textStyleHeader3(),
                    label: 'GPS',
                    values: (value) => _ac = value),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        child: Text('+ Tambah'),
      ),
    );
  }
}
