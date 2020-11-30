import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrizi_ilyes_bmi_project/Controllers/SumBinding/MySumBinding.dart';

import 'LanguageAppUtil/MyLanguage.dart';
import 'Screens/BMIValueInput.dart';
import 'Screens/ResultBMI.dart';

void main() async {
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,

    // this is my routing Name
   initialRoute: '/BMIValueInput',
   defaultTransition: Transition.zoom,
    translations: MyLanguage(),
    locale: Get.deviceLocale,
    fallbackLocale: Locale('fr'),
    getPages: [GetPage(name:'/BMIValueInput',page: () => BMIValueInput(),binding :MySumBinding()),
      GetPage(name: '/ResultBMI', page: () => ResultBMI(),binding :MySumBinding(),)]
  ));
}
