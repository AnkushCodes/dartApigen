import 'dart:io';

import 'package:dockerflutter/gen/genrator_file.dart';

void main(List<String> arguments) {
 String valpath ="feature";
 String fileName="";
 if(arguments.isNotEmpty && arguments[0]!=null){
  fileName ="${arguments[0]}";
  }else{
    exit(0);
  }
  List<String> listOfFiles = [
    "../${valpath}/${fileName}/model/$fileName.dart",
    "../${valpath}/${fileName}/repository/${fileName}Repo.dart",
    "../${valpath}/${fileName}/controller/${fileName}Controller.dart"
  ];

  for (String filepath in listOfFiles) {
    File file = File(filepath);
    String filedir = file.parent.path;
    String filename = file.uri.pathSegments.last;

    if (filedir.isNotEmpty) {
      Directory(filedir).createSync(recursive: true);
      print("Creating directory: $filedir for the file: $filename");
    }

    if (!file.existsSync() || file.lengthSync() == 0) {
      file.createSync(recursive: true);
      String infile =filename.split(".").first;
      String data =MainFile().getMainFile("$filedir","$filename",infile);
       file .writeAsStringSync("$data");
      print("Creating empty file: $filepath");
    } else {
      print("$filename already exists");
    }
  }
}
