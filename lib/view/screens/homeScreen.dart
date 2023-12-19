// ignore: file_names
import 'package:firebase_task/view/auth/login_screen.dart';
import 'package:firebase_task/view/auth/sign_up.dart';
import 'package:firebase_task/view/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    body: 
    Center(
      child : Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/h.png", width: 300,
            ),
              const SizedBox(height: 20,),
          CustomBtn(text: "Log In", onTab: (){
              Get.offAll(()=>LoginScreen());
          }),
          const SizedBox(height: 20,),
           CustomBtn(text: "Sign Up", onTab: (){
              Get.offAll(()=>SignUpScreen());
          }),
        ],),
      )
    ),

  );
  }

}