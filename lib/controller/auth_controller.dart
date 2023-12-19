import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task/repositry/auth_repositry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();


final email = TextEditingController();
final password = TextEditingController();
final name = TextEditingController();

 void registerUser(String email, String password){
  AuthRepositry.instance.createUserWithEmailAndPassword(email,password);
  
}

 void loginUser(String email, String password){
  AuthRepositry.instance.signInWithEmailAndPassword(email,password);
  
}




void signout ()async{
  await FirebaseAuth.instance.signOut();
}
  
}


   
