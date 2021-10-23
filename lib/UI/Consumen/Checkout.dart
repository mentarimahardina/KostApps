import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/CItemDetail.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/bar.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/Dashboad.dart';
import 'package:kostqu/UI/Consumen/Transaksi.dart';

class Checkout extends StatefulWidget {
  @override
  final String nama, harga, foto;
  final DateTime checkin;
  final DateTime checkout;
  Checkout({this.nama, this.harga, this.foto, this.checkin, this.checkout});
  _CheckoutState createState() => _CheckoutState(
      this.nama, this.harga, this.foto, this.checkin, this.checkout);
}

class _CheckoutState extends State<Checkout> {
  var loading = false;
  bool visibility = false;
  String nama, harga, foto;
  DateTime checkin;
  DateTime checkout;
  _CheckoutState(this.nama, this.harga, this.foto, this.checkin, this.checkout);
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
              title: 'Checkout',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(Style.l(context) / 20),
                  margin: EdgeInsets.symmetric(
                    horizontal: Style.l(context) / 15,
                  ),
                  alignment: Alignment.center,
                  color: Style.colorOrange,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(foto), fit: BoxFit.cover)),
                        height: Style.p(context) / 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(Style.l(context) / 15),
                        margin: EdgeInsets.symmetric(
                          horizontal: Style.l(context) / 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              nama,
                              textAlign: TextAlign.center,
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
                            ItemDetail(
                              title: 'Nama',
                              value: nama,
                            ),
                            ItemDetail(
                              title: 'Tanggal Masuk',
                              value: DateFormat("dd - MM - yyyy")
                                  .format(checkin)
                                  .toString(),
                            ),
                            ItemDetail(
                              title: 'Tanggal Keluar',
                              value: DateFormat("dd - MM - yyyy")
                                  .format(checkout)
                                  .toString(),
                            ),
                            ItemDetail(
                              title: 'Harga',
                              value: harga,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Func().navroot(
                        context,
                        Transaksi(
                          nama: nama,
                          harga: harga,
                          foto: foto,
                          checkin: DateFormat("dd - MM - yyyy")
                              .format(checkin)
                              .toString(),
                          checkout: DateFormat("dd - MM - yyyy")
                              .format(checkout)
                              .toString(),
                        ));
                  },
                  child: Text('Lanjutkan'),
                ),
                SizedBox(height: Style.p(context) / 50)
              ],
            )));
  }
}
