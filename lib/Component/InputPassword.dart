import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';

class InputPassword extends StatelessWidget {
  final TextInputType type;
  final TextStyle labelStyle;
  final Widget icon;
  final bool visibility;
  final String label;
  FormFieldSetter<String> values;

  InputPassword({
    @required this.type,
    @required this.labelStyle,
    this.visibility,
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
          showCursor: false,
          obscureText: !visibility,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: labelStyle,
            labelText: label,
            suffixIcon: icon,
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
