import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/InputDate.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/Checkout.dart';

class PeriodeSewa extends StatefulWidget {
  @override
  final ModelsKamar data;
  final String nama, harga, foto;
  PeriodeSewa({this.data, this.nama, this.harga, this.foto});
  _PeriodeSewaState createState() =>
      _PeriodeSewaState(this.data, this.nama, this.harga, this.foto);
}

class _PeriodeSewaState extends State<PeriodeSewa> {
  String checkin, checkout;
  DateTime tanggalin, tanggalout;
  var periode;
  var loading = false;
  bool visibility = false;
  String nama, harga, foto;
  ModelsKamar data;
  _PeriodeSewaState(this.data, this.nama, this.harga, this.foto);

  Future<void> _selectDatein(BuildContext context) async {
    tanggalin = DateTime.now();
    await showDatePicker(
            context: context,
            initialDate: tanggalin,
            firstDate: DateTime.now(),
            lastDate: DateTime(2050, 1))
        .then((value) {
      setState(() {
        if (value != null) {
          tanggalin = value;
          checkin = DateFormat("dd - MM - yyyy").format(tanggalin).toString();
        }
      });
    });
    return tanggalin;
  }

  Future<void> _selectDateout(BuildContext context) async {
    tanggalout = tanggalin.add(const Duration(days: 1));

    await showDatePicker(
            context: context,
            initialDate: tanggalout,
            firstDate: tanggalout,
            lastDate: DateTime(2050, 1))
        .then((value) {
      setState(() {
        if (value != null) {
          tanggalout = value;
          checkout = DateFormat("dd - MM - yyyy").format(tanggalout).toString();
          periode = (DateTimeRange(start: tanggalin, end: tanggalout).duration)
              .inDays;
        }
      });
    });
    return tanggalout;
  }

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
              title: 'Periode Sewa',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Style.colorOrange,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InputDate(
                        title: 'Tanggal Masuk',
                        value: tanggalin,
                        pilihdate: () {
                          _selectDatein(context);
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      tanggalin != null
                          ? InputDate(
                              title: 'Tanggal Keluar',
                              value: tanggalout,
                              pilihdate: () {
                                _selectDateout(context);
                              },
                            )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      tanggalout != null
                          ? Column(
                              children: [
                                Text(periode.toString() + " hari"),
                                ElevatedButton(
                                  onPressed: () {
                                    Func().navroot(
                                        context,
                                        Checkout(
                                          nama: nama,
                                          harga: harga,
                                          foto: foto,
                                          checkin: tanggalin,
                                          checkout: tanggalout,
                                        ));
                                  },
                                  child: Text('Pilih Periode Sewa'),
                                ),
                                // Text(harga)
                              ],
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ],
            )));
    // floatingActionButton: bar()));
  }
}
