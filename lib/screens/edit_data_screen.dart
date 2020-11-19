import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editDataScreen extends StatefulWidget {
  static const String routeName = '/editDataScreen';

  @override
  _editDataScreenState createState() => _editDataScreenState();
}

class _editDataScreenState extends State<editDataScreen> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final List<String> data = arguments['data'];
    print(data.length);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Name: ${data[1]} ${data[2]} ',
            style: TextStyle(color: Colors.black),
          )),
          Center(
              child: Text(
            'Age: ${data[3]} ',
            style: TextStyle(color: Colors.black),
          )),
          Center(
              child: Text(
            'Address ${data[4]} ',
            style: TextStyle(color: Colors.black),
          )),
          Center(
              child: Text(
            'GPA ${data[5]} ',
            style: TextStyle(color: Colors.black),
          )),
        ],
      ),
    );
  }
}
