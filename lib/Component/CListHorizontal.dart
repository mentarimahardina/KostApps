import 'package:flutter/material.dart';
import 'package:kostqu/Component/ListHorizontal.dart';
import 'package:kostqu/Component/Style.dart';

class CListH extends StatelessWidget {
  final String label;
  final List data;
  final Function action;
  final double lebar;
  CListH({this.label, this.data, this.action, this.lebar});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Style.l(context) / 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(label,
                style:
                    Style.textStyleHeader1(fontColor: Colors.grey, bold: true)),
            listHorizontal(
              data: data,
              lebar: lebar,
            ),
          ],
        ));
  }
}
