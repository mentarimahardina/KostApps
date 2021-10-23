import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/CItemDetail.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/InputDate.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/bar.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/PeriodeSewa.dart';

class DetailKamar extends StatefulWidget {
  @override
  final ModelsKamar data;

  DetailKamar(this.data);
  _DetailKamarState createState() => _DetailKamarState(this.data);
}

class _DetailKamarState extends State<DetailKamar> {
  final _formKey = GlobalKey<FormState>();
  String checkin;
  DateTime tanggal;
  var loading = false;
  ModelsKamar data;
  Color color;
  _DetailKamarState(this.data);
  @override
  void initState() {
    super.initState();
    print(data.nama);
    print(data.kamarmandi);
  }

  Future<void> _selectDate(BuildContext context) async {
    tanggal = DateTime.now();
    await showDatePicker(
            context: context,
            initialDate: tanggal,
            firstDate: DateTime.now(),
            lastDate: DateTime(2050, 1))
        .then((value) {
      setState(() {
        if (value != null) {
          tanggal = value;
          checkin = DateFormat("dd - MM - yyyy").format(tanggal).toString();
        }
      });
    });
    return tanggal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data.foto), fit: BoxFit.cover)),
            color: color,
            height: Style.p(context) / 2,
            child: Container(
              width: Style.l(context),
              padding: EdgeInsets.only(top: 25),
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Style.l(context) / 15),
            margin: EdgeInsets.symmetric(
              horizontal: Style.l(context) / 15,
            ),
            child: Column(
              children: [
                Text(
                  data.nama,
                  style: Style.textStyleHeader1(bold: true),
                ),
                Text(
                  data.harga,
                  style: Style.textStyleHeader3(),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(Style.l(context) / 15),
            margin: EdgeInsets.symmetric(
              horizontal: Style.l(context) / 15,
            ),
            alignment: Alignment.center,
            color: Style.colorOrange,
            child: Column(
              children: [
                ItemDetail(
                  title: 'Ukuran',
                  value: data.ukuran,
                ),
                ItemDetail(
                  title: 'Kamar mandi',
                  value: data.kamarmandi,
                ),
                ItemDetail(
                  title: 'Kasur',
                  value: data.kasur,
                ),
                ItemDetail(
                  title: 'AC',
                  check: data.ac != null ? data.ac : false,
                ),
                ItemDetail(
                  title: 'Meja Belajar',
                  check: false,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Func().navroot(context,
              PeriodeSewa(nama: data.nama, harga: data.harga, foto: data.foto));
        },
        child: Text('Pilih Kamar'),
      ),
    );
  }
}
