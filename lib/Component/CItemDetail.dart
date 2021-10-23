import 'package:flutter/material.dart';
import 'package:kostqu/Component/ListHorizontal.dart';
import 'package:kostqu/Component/Style.dart';

class ItemDetail extends StatelessWidget {
  String title;
  String value;
  bool check;

  ItemDetail({this.title, this.value, this.check});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: Style.textStyleHeader3(),
                )),
            Expanded(flex: 1, child: Text(':')),
            Expanded(
                flex: 4,
                child: value != null
                    ? Text(
                        value,
                        textAlign: TextAlign.end,
                        style: Style.textStyleHeader3(),
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        child: check
                            ? Icon(Icons.check)
                            : Icon(Icons.cancel_outlined)))
          ],
        ));
  }
}
