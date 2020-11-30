import 'package:get/get.dart';

import '../BMIControllers.dart';

class MySumBinding extends Bindings
{


  @override
  void dependencies() {
Get.lazyPut<BMIControllers>(()=> BMIControllers());  }

}