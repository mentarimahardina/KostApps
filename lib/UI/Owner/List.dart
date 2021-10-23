import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class ListOwner extends StatelessWidget {
  final int index;
  ListOwner({this.index});

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
  String title = 'kosong';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Style.l(context),
        padding: EdgeInsets.all(5),
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Text(
              "Sekilas Info " + title,
              style: Style.textStyleHeader1(
                fontColor: Colors.white,
              ),
            ),
            Container(
              width: Style.l(context) - 20,
              height: Style.p(context) / 8,
              color: listdata[index]["color"],
              alignment: Alignment.center,
              child: Text(
                "Sekilas Info " + title,
                style: Style.textStyleHeader1(
                  fontColor: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
