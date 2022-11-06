import 'package:flutter_sqflite_project/core/class/statusrequest.dart';

handlingData(res){
  if(res is StatusRequest){
    return res;
  }else{
    return StatusRequest.success;
  }
}