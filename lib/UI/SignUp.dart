import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/InputPassword.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/UI/Login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _nama, _nohp, _asal, _email, _password, _passwordKon;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var loading = false;
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: Style.p(context),
              ),
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(Style.l(context) / 14),
                margin: EdgeInsets.all(Style.l(context) / 30),
                decoration: BoxDecoration(
                  color: Style.colorGreen,
                  borderRadius: Style.rad,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        alignment: Alignment.topLeft,
                        child: Text("Daftar",
                            style: Style.textStyleHeader1(
                                fontColor: Colors.white, bold: true)),
                      ),
                      Input(
                        type: TextInputType.text,
                        labelStyle: Style.textStyleHeader3(),
                        label: 'Nama',
                        values: (value) {
                          _email = value;
                        },
                      ),
                      Input(
                        type: TextInputType.text,
                        labelStyle: Style.textStyleHeader3(),
                        label: 'Asal',
                        values: (value) {
                          _asal = value;
                        },
                      ),
                      Input(
                        type: TextInputType.phone,
                        labelStyle: Style.textStyleHeader3(),
                        label: 'No HP',
                        values: (value) {
                          _nohp = value;
                        },
                      ),
                      InputPassword(
                          type: TextInputType.text,
                          labelStyle: Style.textStyleHeader3(),
                          visibility: visibility,
                          icon: IconButton(
                            icon: Icon(
                              visibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                                print(visibility);
                              });
                            },
                          ),
                          label: 'password',
                          values: (value) {
                            _password = value;
                          }),
                      InputPassword(
                          type: TextInputType.text,
                          labelStyle: Style.textStyleHeader3(),
                          visibility: visibility,
                          icon: IconButton(
                            icon: Icon(
                              visibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                                print(visibility);
                              });
                            },
                          ),
                          label: 'Konfirmasi password',
                          values: (value) {
                            _passwordKon = value;
                          }),
                      FlatButton(
                        onPressed: () {
                          print('Button login ditekan');
                          Func().nav(context, Login());
                        },
                        child: Text("Sudah punya akun? Masuk",
                            style: Style.textStyleHeader3()),
                      ),
                      loading
                          ? CircularProgressIndicator()
                          : FlatButton(
                              color: Style.colorYellow,
                              child: Text(
                                "Daftar",
                                style: Style.textStyleHeader3(
                                    fontColor: Style.colorBlue),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: Style.rad),
                              onPressed: () {
                                _formKey.currentState.save();
                                print('button SignUp');
                                print("nama :$_nama");
                                print("nohp :$_nohp");
                                print("asal :$_asal");
                                print("email :$_email");
                                print("password :$_password");
                                print("passwordKon :$_passwordKon");
                                if (_password != _passwordKon) {
                                  print("password tidak sama");
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
