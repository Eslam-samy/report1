import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:report1/helper/my_storage.dart';

class viewDataScreen extends StatefulWidget {
  static const String routeName = '/viewdataScreen';

  @override
  _viewDataScreenState createState() => _viewDataScreenState();
}

class _viewDataScreenState extends State<viewDataScreen> {
  MyStorage storage = new MyStorage();
  String textRead = '';
  List<String> data;

  List<String> split(String string, String separator, {int max = 0}) {
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

  @override
  void initState() {
    super.initState();
    //reaad the data from extrnal storage
    storage.readContent().then((String value) {
      setState(() {
        textRead = value;
        data = split(textRead, '//');
        print(data.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
      //check if data ==null or not
          ? Center(child: Text(textRead))
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, i) =>
            Center(
              child: Text(data[i]),
            ),
      ),
    );
  }
}
