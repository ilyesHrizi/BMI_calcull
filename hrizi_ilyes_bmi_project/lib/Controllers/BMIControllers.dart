import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrizi_ilyes_bmi_project/Screens/ResultBMI.dart';

class BMIControllers extends GetxController {
  //height weight age
  int height ;
  var weight = 0.obs;
  final  age= 0.obs ;
  double _bmi;
  double sexe ;
  String r1="OVERWEIGHT";
  String r2="NORMAL";
  String r3="UNDERWEIGHT";
  String r4="You have a higher than normal body weight. Try to exercise more!";
  String r5="You have a normal body weight. Good job!";
  String r6="You have a lower than normal body weight. You should eat more";
String name;
  @override
  void onInit() {
    // TODO: implement onInit
    GetStorage box = GetStorage();
    if (box.read("height") != null && box.read("weight") && box.read("age")) {
      weight.value = box.read("weight");
      age.value = box.read("age");
      _bmi= box.read("bmi");
      sexe = box.read("sexe");
    }
  }

  incrementW() => weight.value ++;
  incrementA() => age.value++;
  decrementW() => weight.value--;
  decrementA() => age.value--;
  resultBmi() => ResultBMI();
  getRes() => getResult();
  getInterpreta() => getInterpretation();
  getname()=>getName(name);
   int calculateBMI(int  i) {

    return height = i.round();
  }

  String ResultBMI()
{
  print(_bmi = weight / pow(height / 100, 2));
  return _bmi.toStringAsFixed(1);
}
 String getResult() {
     if(sexe == 1) {
       if (_bmi <= 25) {
         return r1;
       } else if (_bmi > 18.5) {
         return r2;
       } else {
         return r3;
       }
     }

     else{
       if (_bmi >= 25) {
         return r1;
       } else if (_bmi > 18.5) {
         return r2;
       } else {
         return r3;
       }
     }
  }

 String getInterpretation() {
     if(sexe == 1) {
       if(age<18)
         {
       if (_bmi >= 25 ) {
         return r4;
       } else if (_bmi > 18.5) {
         return r5;
       } else {
         return r6;
       }}
       else if(age > 18 && age<=45)
         {
           if (_bmi >= 25.4 ) {
             return r4;
           } else if (_bmi > 18) {
             return r5;
           } else {
             return r6;
           }
         }

     }
     else{
       if(age<17)
       {
         if (_bmi >= 24 ) {
           return r4;
         } else if (_bmi > 17.3) {
           return r5;
         } else if(_bmi < 17.3){
           return r6;
         }}
       else if(age > 18 && age<=45)
       {
         if (_bmi >= 23.4 ) {
           return r4;
         } else if (_bmi > 22) {
           return r5;
         } else {
           return r6;
         }
       }
     }
  }
  double male()
  {
    return sexe = 1;
  }
  double female()
  {
    return sexe = 0;
  }
  String getName(String nameI)
  {
    return name = nameI;
  }
}