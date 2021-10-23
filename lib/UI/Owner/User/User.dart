import 'package:flutter/material.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsUser.dart';

class DataUser extends StatefulWidget {
  @override
  _DataUserState createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  var loading = false;
  List<ModelsUser> listdata = [];

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

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Text(
              'Data User',
              style: Style.textStyleHeader1(
                fontColor: Style.colorBlue,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listdata.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: Style.colorBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.symmetric(
                              vertical: Style.l(context) / 60),
                          padding: EdgeInsets.all(Style.l(context) / 50),
                          child: Row(
                            children: [
                              Container(
                                width: 110,
                                height: 100,
                                child: Icon(
                                  Icons.person_outlined,
                                  size: 60,
                                  color: Style.colorOrange,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listdata[index].nama,
                                      style: Style.textStyleHeader3(
                                          bold: true, fontColor: Colors.white),
                                    ),
                                    Text(listdata[index].jk),
                                    Text(listdata[index].tglahir),
                                    Text(listdata[index].asal),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
            )
          ],
        ));
  }
}
