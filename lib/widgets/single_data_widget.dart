import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report1/models/student.dart';
import 'package:report1/screens/edit_data_screen.dart';

InkWell singleDataContaienr(
    {@required String title,
    @required BuildContext context,
    @required Function function}) {
  List<String> split(String string, String separator, {int max = 0}) {
    Student student;
    var result = List<String>();

    if (separator.isEmpty) {
      result.add(string);
      return result;
    }

    while (true) {
      var index = string.indexOf(separator, 0);
      if (index == -1 || (max > 0 && result.length >= max)) {
        result.add(string);
        break;
      }

      result.add(string.substring(0, index));
      string = string.substring(index + separator.length);
    }

    return result;
  }

  List<String> mydata = split(title, ' ');

  return InkWell(
    onTap: () {
      Navigator.of(context)
          .pushNamed(editDataScreen.routeName, arguments: {'data': mydata});
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x20779AF1),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ]),
      height: 100,
      width: double.maxFinite,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Center(
            child:
                mydata == null ? Text('') : Text('${mydata[1]}')),
        trailing: FlatButton(
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: function,
        ),
      ),
    ),
  );
}
