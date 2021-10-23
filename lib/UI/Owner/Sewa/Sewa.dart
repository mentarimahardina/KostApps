import 'package:flutter/material.dart';
import 'package:kostqu/Component/Function.dart';
import 'package:kostqu/Component/Style.dart';
import 'package:kostqu/Component/topBar.dart';
import 'package:kostqu/Connection/Services.dart';
import 'package:kostqu/Models/ModelsSewa.dart';
import 'package:kostqu/Models/ModelsSewa.dart';
import 'package:kostqu/UI/Consumen/ListTransport.dart';

class DataSewa extends StatefulWidget {
  @override
  _DataSewaState createState() => _DataSewaState();
}

class _DataSewaState extends State<DataSewa> {
  var loading = false;
  List<ModelsSewa> listdata = [];

  Future<void> getData() async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    Services services = Services(context: context);
    List<ModelsSewa> tempData = await services.getDataSewa();

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
              'Data Sewa',
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
                                decoration: BoxDecoration(
                                    color: Style.colorOrange,
                                    image: DecorationImage(
                                        image: AssetImage(listdata[index].foto),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listdata[index].nama,
                                      style:
                                          Style.textStyleParagraph(bold: true),
                                    ),
                                    Text(listdata[index].sewa),
                                    Text(listdata[index].checkin +
                                        ' - ' +
                                        listdata[index].checkout),
                                  ],
                                ),
                              ),
                              Expanded(child: Text(listdata[index].status))
                            ],
                          )),
                    );
                  }),
            )
          ],
        ));
  }
}
