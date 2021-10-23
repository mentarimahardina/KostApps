import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Models/ModelsKamar.dart';
import 'package:kostqu/UI/Consumen/DetailKamar.dart';

class CRoom extends StatelessWidget {
  final String label;
  final List<ModelsKamar> data;
  final Function action;
  CRoom({this.label, this.data, this.action});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            Func().nav(context, DetailKamar(data[index]));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Style.colorOrange,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.symmetric(vertical: Style.l(context) / 50),
              padding: EdgeInsets.all(Style.l(context) / 50),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Style.colorOrange,
                        image: DecorationImage(
                            image: AssetImage(data[index].foto),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].nama,
                          style: Style.textStyleHeader3(
                              bold: true, fontColor: Style.colorBlue),
                        ),
                        Text(
                          data[index].ukuran,
                          style: Style.textStyleParagraph(
                              fontColor: Style.colorBlue),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      data[index].harga,
                      style:
                          Style.textStyleParagraph(fontColor: Style.colorBlue),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
