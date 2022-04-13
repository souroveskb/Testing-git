import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Photo{

  late int id;
  late String photoName;

  Future<String> getFilePath() async {//eta photoaddview class eo rakhsi output eta ashe== /data/user/0/com.example.ui_projects/app_flutter
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath';///demoTextFile.txt'; // 3
    print(appDocumentsPath);
    return filePath;
  }

  void saveFile() async {//eta ar nicher ta run kore dekhini
    File file = File(await getFilePath()); // 1
    file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt"); // 2
  }

  void readFile() async {
    File file = File(await getFilePath()); // 1
    String fileContent = await file.readAsString(); // 2
    print('File Content: $fileContent');
  }
}