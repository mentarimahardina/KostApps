import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/UI/Owner/Master/Master.dart';
import 'package:kostqu/UI/Owner/Pembayaran/Pembayaran.dart';
import 'package:kostqu/UI/Owner/Sewa/Sewa.dart';
import 'package:kostqu/UI/Owner/User/User.dart';

class AdminDashboard extends StatefulWidget {
  @override
  final String nama, harga, foto;

  AdminDashboard({this.nama, this.harga, this.foto});
  _AdminDashboardState createState() =>
      _AdminDashboardState(this.nama, this.harga, this.foto);
}

class _AdminDashboardState extends State<AdminDashboard>
    with TickerProviderStateMixin {
  var loading = false;
  bool action2 = false;
  String nama, harga, foto;
  _AdminDashboardState(this.nama, this.harga, this.foto);
  int _currentNav = 0;
  String title = 'kosong';

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
              isUser: true,
            ),
            body: _currentNav == 0
                ? DataSewa()
                : _currentNav == 1
                    ? DataPembayaran()
                    : _currentNav == 2
                        ? DataMaster()
                        : DataUser(),
            bottomNavigationBar: BottomNavigationBar(
              selectedIconTheme: IconThemeData(size: 30),
              selectedItemColor: Style.colorBlue,
              selectedLabelStyle: Style.textStyleParagraph(),
              currentIndex: _currentNav,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    color: Style.colorBlue,
                  ),
                  label: "Data Sewa",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.money,
                    color: Style.colorBlue,
                  ),
                  label: "Pembayaran",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard_outlined,
                    color: Style.colorBlue,
                  ),
                  label: "Data Master",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: Style.colorBlue),
                  label: "User",
                )
              ],
              onTap: (index) {
                setState(() {
                  print(index);
                  _currentNav = index;
                });
              },
            )));
  }
}
