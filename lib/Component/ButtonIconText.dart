import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class ButtonIconText extends StatelessWidget {
  String title;
  Widget icon;
  Function action;
  Function action2;
  ButtonIconText({
    @required this.title,
    @required this.action,
    this.action2,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: Style.p(context) / 4.5,
      color: Style.colorOrange,
      child: OutlinedButton(
          onPressed: action,
          onLongPress: action2 == null ? () {} : action2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                title,
                style: Style.textStyleHeader2(
                    fontColor: Style.colorBlue, bold: true),
              )
            ],
          )),
    );
  }
}
