import 'package:firebase_task/controller/auth_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies(){
  Get.lazyPut(() => AuthController());
  }

}