import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task/firebase_options.dart';
import 'package:firebase_task/helper/binding.dart';
import 'package:firebase_task/repositry/auth_repositry.dart';
import 'package:firebase_task/view/screens/add_upload_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then((value) => Get.put(AuthRepositry()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    initialBinding: Binding(),
      home:   UploadImage(),
    );
  }
}
