import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class Input extends StatelessWidget {
  final TextInputType type;
  final TextStyle labelStyle;
  final Widget icon;
  final String label;
  FormFieldSetter<String> values;

  Input({
    @required this.type,
    @required this.labelStyle,
    this.icon,
    @required this.label,
    @required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: Style.p(context) / 55),
        child: TextFormField(
          keyboardType: type,
          decoration: InputDecoration(
            focusColor: Colors.amber,
            icon: icon,
            filled: true,
            fillColor: Colors.white,
            labelStyle: labelStyle,
            labelText: label,
          ),
          onSaved: values,
          validator: (value) {
            if (value.isEmpty) {
              return 'tidak boleh kosong';
            }
          },
        ));
  }
}
