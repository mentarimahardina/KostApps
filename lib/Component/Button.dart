import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class Button extends StatelessWidget {
  String title;
  bool loading;
  Function action;
  Button({
    @required this.title,
    @required this.action,
    @required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : ElevatedButton(
            child: Text(
              title,
              style: Style.textStyleHeader2(fontColor: Colors.white),
            ),
            onPressed: action,
          );
  }
}
