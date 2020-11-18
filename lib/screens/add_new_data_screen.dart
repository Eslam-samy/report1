
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report1/helper/my_storage.dart';
import 'package:report1/models/student.dart';
import 'package:report1/widgets/input_container.dart';

class addNewDataScreen extends StatefulWidget {
  static const String routeName = '/addnewdata';

  @override
  _addNewDataScreenState createState() => _addNewDataScreenState();
}

class _addNewDataScreenState extends State<addNewDataScreen> {
  MyStorage storage = new MyStorage();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();
  var gpaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report 1 DR/Hisham'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildInputContainer(
              controller: nameController, label: 'name', context: context),
          SizedBox(
            height: 15,
          ),
          buildInputContainer(
              controller: addressController,
              label: 'Address',
              context: context),
          SizedBox(
            height: 15,
          ),
          buildInputContainer(
              controller: ageController,
              label: 'age',
              context: context,
              tib: TextInputType.number),
          SizedBox(
            height: 15,
          ),
          buildInputContainer(
              controller: gpaController,
              label: 'gpa',
              context: context,
              tib: TextInputType.number),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Container(
            height: 50,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 8, bottom: 7),
            margin: EdgeInsets.only(top: 10, left: 25, right: 25),
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color.fromRGBO(241, 96, 36, 1),
                      const Color.fromRGBO(237, 24, 103, 1),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x20779AF1),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ]),
            child: FlatButton(
              onPressed: () {
                // fill the object of data then pass it to save method
                Student student = new Student(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    gpa: double.parse(gpaController.text),
                    address: addressController.text);
                storage.writeContent(student);
                print('loading');
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
