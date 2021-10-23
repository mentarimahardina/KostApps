import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

class InputDate extends StatelessWidget {
  final String title;
  Function pilihdate;
  DateTime value;
  InputDate(
      {@required this.title, @required this.pilihdate, @required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pilihdate,
      child: Container(
          child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.date_range_outlined,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            width: 21,
          ),
          Expanded(
              flex: 14,
              child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 19,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                  child: value == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 18),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              DateFormat("dd - MM - yyyy")
                                  .format(value)
                                  .toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        )))
        ],
      )),
    );
  }
}
