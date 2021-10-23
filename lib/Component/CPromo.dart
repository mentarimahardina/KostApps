import 'package:flutter/material.dart';
import 'package:kostqu/Component/ListHorizontal.dart';
import 'package:kostqu/Component/Style.dart';

class CPromo extends StatelessWidget {
  final List data;
  CPromo({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Style.p(context) / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
              width: Style.l(context) / 1.2,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    width: Style.l(context) - 10,
                    height: Style.p(context) / 3 - 10,
                    color: data[index]["color"],
                    alignment: Alignment.center,
                    child: Text(
                      "Sekilas Info " + data[index]["name"],
                      style: Style.textStyleHeader1(
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
