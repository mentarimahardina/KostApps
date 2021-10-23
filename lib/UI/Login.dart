import 'package:flutter/material.dart';
import 'package:kostqu/Component/Button.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Input.dart';
import 'package:kostqu/Component/InputPassword.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsUser.dart';
import 'package:kostqu/UI/Consumen/Dashboad.dart';
import 'package:kostqu/UI/Owner/Dashboard.dart';
import 'package:kostqu/UI/SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool bypassAuth = false;

  String _email, _password;
  bool visibility = false;
  var loading = false;
  List<ModelsUser> listdata = [];
  String status = '';
  Future<void> getData() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsUser> tempData = await services.getDataUser();

    setState(() {
      loading = false;
      listdata = tempData;
    });
  }

  Future<void> login(String email, String password) async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsUser> tempData = await services.getDataUser();

    setState(() {
      loading = false;
      listdata = tempData;
    });
    print(email + ' - ' + password);
    status = '';
    var ada = listdata.where((user) => user.username.contains(email));
    print(ada);

    if (ada.length != 0) {
      if (ada.first.password == password) {
        if (ada.first.type == 1) {
          Func().navroot(context, AdminDashboard());
        } else {
          Func().navroot(context, ConsDashboard());
        }
      } else {
        error(1, 'username /password tidak cocok');
      }
    } else {
      error(2, 'username /password tidak cocok');
    }

    // if (pass == password) {
    // } else {
    // }
    // if (check.length != 0) {
    //   print('ada');

    //   if (check. != password) {
    //     print('password tidak sama');
    //   } else {
    //     print('password  sama');
    //   }
    // } else {
    //   print('tidak ada');
    // }
    // for (var item in listdata) {
    //   if (item.username == email && item.password == password) {
    //     if (item.type == 1) {
    //       Func().nav(context, AdminDashboard());
    //     } else {
    //       Func().nav(context, ConsDashboard());
    //     }
    //   } else {
    //     status = 'username /password tidak cocok';
    //     error(400, status);
    //   }
    // }

    // Func().nav(context, ConsDashboard());
  }

  @override
  void initState() {
    super.initState();
    _email = "";
    _password = "";

    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Style.colorBlue,
          body: ListView(
            children: [
              Container(
                height: Style.p(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit_rounded,
                      size: Style.p(context) / 10,
                      color: Style.colorOrange,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: Style.l(context) / 20,
                      ),
                      padding: EdgeInsets.all(Style.l(context) / 35),
                      decoration: BoxDecoration(
                          color: Style.colorOrange,
                          borderRadius: Style.rad,
                          boxShadow: Style.shadow),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text("Kost Que",
                                style: Style.textStyleHeader1(
                                    fontColor: Style.colorBlue, bold: true)),
                            //               Column(
                            //                 children: [
                            SizedBox(
                              height: 10,
                            ),
                            Input(
                              type: TextInputType.text,
                              labelStyle: Style.textStyleHeader3(),
                              label: 'Username',
                              values: (value) {
                                _email = value;
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
                                label: 'Password',
                                values: (value) {
                                  _password = value;
                                }),

                            TextButton(
                              onPressed: () {
                                print('Button daftar ditekan');

                                Func().nav(context, SignUp());
                              },
                              child: Text("Belum punya akun? Daftar",
                                  style: Style.textStyleHeader3()),
                            ),
                            Button(
                                title: 'Masuk',
                                action: () {
                                  if (bypassAuth) {
                                    return;
                                  }
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }
                                  _formKey.currentState.save();

                                  login(_email, _password);
                                },
                                loading: loading),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  error(statusid, String message) {
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
            content: Text(
              message,
              textScaleFactor: 1,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
