import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Teacherfirstsecationcontroller extends GetxController{

  TextEditingController educationLevelController=TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  techerdetels()async{
   try{
     var body={
       "education_level":educationLevelController.text,
       "from_date":fromDateController.text,
       "to_date":toDateController.text,

     };

     print(body);


   }catch(e){
     print(e);
   }




  }

  // newadd(){
  //
  //
  //
  // }

Clear(){
  educationLevelController.clear();
  fromDateController.clear();
  toDateController.clear();
}










}