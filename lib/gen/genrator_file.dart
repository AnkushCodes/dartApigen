

class MainFile{

  getMainFile(String path,String mainFile,String inFile){
    if(path.contains("controller")){
 String getController ="""
import 'dart:ffi';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class $inFile {
add$inFile(Request request) async {
    try {

    }catch(e){
    }
    }
  delete$inFile(Request request) async {
    try {

    }catch(e){
    }
    }
  get$inFile(Request request) async {
    try {

    }catch(e){
    }
    }
  get${inFile}s(Request request) async {
    try {

    }catch(e){
    }
    }
  update$inFile(Request request) async {
    try {

    }catch(e){
    }
    }
  }
""";
return getController;
    }else if(path.contains("model")){
String getmodle ="""
class $inFile {
  
  $inFile();
}
""";
return getmodle;
      }else if(path.contains("repository")){


String getrepository ="""
import 'dart:ffi';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class inFile{
   get${inFile}s() {
    
  }

   get${inFile}() {
   
  }

   add${inFile}() {

  }

   update${inFile}() {

  }

   delete${inFile}() {

    
  }
}
""";
return getrepository;
      }
  }

 
 

}