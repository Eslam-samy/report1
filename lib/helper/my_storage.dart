import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:report1/models/student.dart';

class MyStorage {

  // to return the local path in phone

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // to get the txt file
  Future<File> get localFile async {
    final path = await localPath;
    print(path);
    return File('$path/admt.txt');
  }

  //read the file content
  Future<String> readContent() async {
    try {
      final file = await localFile;
      String Contents = await file.readAsString();
      return Contents;
    } catch (e) {
      return 'there are no data yet';
    }
  }

  // write into file
  Future<File> writeContent(Student student) async {
    readContent().then((value) async{
      final file = await localFile;
      return file.writeAsString(
          '$value ${student.name} ${student.age} ${student.address} ${student.gpa}//');
    });

  }
}
