import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class Func {
  void navroot(BuildContext context, page) {
    Navigator.of(context)
        .push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, Animation<double> animation, __, Widget widget) {
        return Opacity(
          opacity: animation.value,
          child: widget,
        );
      },
      transitionDuration: Duration(milliseconds: 250),
    ))
        .then((value) {
      print('root');
      print(value);
      // Navigator.pop(context);
    });
  }

  void nav(BuildContext context, page) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, Animation<double> animation, __, Widget widget) {
        return Opacity(
          opacity: animation.value,
          child: widget,
        );
      },
      transitionDuration: Duration(milliseconds: 250),
    ));
    //   .then((value) {
    // if (value == null) {
    //   popUps(context, false, 'Anda yakin ingin keluar?');
    // }
  }

  popUps(BuildContext context, status, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Column(
                children: [
                  status == true
                      ? Icon(
                          Icons.check_circle_outline_outlined,
                          color: Colors.blue,
                          size: 50,
                        )
                      : Icon(
                          Icons.error_outline_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                ],
              ),
              content: Container(
                  height: Style.p(context) / 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message,
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text('Iya')),
                          SizedBox(
                            width: Style.l(context) / 8,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text('Batal'))
                        ],
                      )
                    ],
                  )));
        });
  }
}
