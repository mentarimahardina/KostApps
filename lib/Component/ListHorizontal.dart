import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/UI/Consumen/DetailKamar.dart';

class listHorizontal extends StatelessWidget {
  final String label;
  final List data;
  final Function action;
  final double lebar;
  listHorizontal({this.label, this.data, this.action, this.lebar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Style.p(context) / 4.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () {
                // Func().navroot(context, DetailKamar(data: data[index]));
              },
              child: Container(
                  width: Style.l(context) / lebar,
                  padding: EdgeInsets.all(5),
                  color: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: Style.l(context) - 20,
                        height: 100,
                        color: data[index]["color"],
                      ),
                      Text(
                        data[index]["name"],
                        style: Style.textStyleHeader3(fontColor: Colors.white),
                      ),
                      Text(
                        data[index]["name"],
                        style: Style.textStyleSubtitle(fontColor: Colors.white),
                      ),
                    ],
                  )));
        },
      ),
    );
  }
}
