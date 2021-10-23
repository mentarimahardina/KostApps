import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kostqu/Component/Function.dart';
import 'UI/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return new MaterialApp(
      title: "Kost QU",
      theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorBrightness: Brightness.light,
          primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "login": (BuildContext context) => new Login(),
      },
    );
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading, isError;
  String message;

  startTime() async {
    print("Timer has started");
    return new Timer(Duration(milliseconds: 1000), () async {
      Func().nav(context, Login());
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/img/bg/splashscreen.png"),
            //         fit: BoxFit.cover))
            ));
  }
}
