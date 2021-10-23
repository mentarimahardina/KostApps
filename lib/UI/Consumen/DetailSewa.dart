import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kostqu/Component/ButtonIconText.dart';
import 'package:kostqu/Component/CItemDetail.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/InputDate.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/UI/Consumen/TypeTransport.dart';

class DetailSewa extends StatefulWidget {
  @override
  final String nama, harga, foto;

  DetailSewa({this.nama, this.harga, this.foto});
  _DetailSewaState createState() =>
      _DetailSewaState(this.nama, this.harga, this.foto);
}

class _DetailSewaState extends State<DetailSewa> {
  final _formKey = GlobalKey<FormState>();
  String checkin;
  DateTime tanggal;
  var loading = false;
  String nama, harga, foto;
  Color color;
  _DetailSewaState(this.nama, this.harga, this.foto);
  @override
  void initState() {
    super.initState();
    print(nama);
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
                    image: AssetImage(foto), fit: BoxFit.cover)),
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
          ButtonIconText(
            title: "Sewa Transport",
            icon: Icon(
              Icons.directions_bike,
              size: 100,
              color: Style.colorBlue,
            ),
            action: () {
              Func().nav(context, TypeTransport());
            },
          )
        ],
      ),
    );
  }
}
