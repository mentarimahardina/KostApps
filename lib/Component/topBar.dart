import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/bar.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  TextEditingController _searchQueryController = TextEditingController();
  final String title;
  final double height;
  final bool backButton;
  final bool isUser;

  final List<Widget> actions;

  TopBar(
      {this.height = 100,
      this.title = '',
      this.backButton = false,
      this.isUser = false,
      this.actions = const []});

  @override
  _TopBarState createState() => _TopBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _TopBarState extends State<TopBar> {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
          padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
              bottom: 5.0,
              top: MediaQuery.of(context).padding.top + 5),
          decoration: BoxDecoration(
            color: (() {
              if (widget.isUser) {
                return Style.colorOrange;
              } else {
                return Style.colorBlue;
              }
            }()),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: (() {
                      if (widget.backButton) {
                        if (widget.isUser) {
                          return SizedBox(
                            height: 36.0,
                            width: 36.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Style.colorBlue,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.zero,
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 36.0,
                            width: 36.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Style.colorOrange,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.zero,
                            ),
                          );
                        }
                      } else {
                        if (widget.isUser) {
                          return SizedBox(
                              height: 36.0,
                              width: 70,
                              child: Text(
                                'Admin Kostque',
                                style: Style.textStyleHeader3(
                                    fontColor: Style.colorBlue, bold: true),
                              ));
                        } else {
                          return SizedBox(
                              height: 36.0,
                              width: 50,
                              child: Text(
                                'Kost Que',
                                style: Style.textStyleHeader3(
                                    fontColor: Style.colorOrange, bold: true),
                              ));
                        }
                      }
                    }()),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    height: 15.0,
                    child: (() {
                      if (widget.isUser) {
                        return Text(
                          widget.title,
                          style: Style.textStyleHeader3(
                              fontColor: Style.colorOrange, bold: true),
                        );
                      } else {
                        return Text(
                          widget.title,
                          style: Style.textStyleHeader3(
                              fontColor: Style.colorOrange, bold: true),
                        );
                      }
                    }()),
                  ),
                ],
              ),
              !widget.backButton
                  ? !widget.isUser
                      ? Row(children: [
                          IconButton(
                              icon: Icon(
                                Icons.history,
                                color: Style.colorOrange,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.power_settings_new,
                                color: Style.colorOrange,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ])
                      : IconButton(
                          icon: Icon(
                            Icons.power_settings_new,
                            color: Style.colorBlue,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                  : Text('')
            ],
          )),
    );
  }
}
