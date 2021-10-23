import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class bar extends StatefulWidget {
  int tap;
  bar({this.tap});

  @override
  _barState createState() => _barState(this.tap);
}

class _barState extends State<bar> {
  var loading = false;
  int _currentNav = 0;
  int tap;
  _barState(this.tap);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            _currentNav = index;
            return tap = index;
          });
        });
  }
}
