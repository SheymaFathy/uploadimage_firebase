import 'package:firebase_task/controller/auth_controller.dart';

import 'package:firebase_task/helper/validation.dart';
import 'package:firebase_task/view/auth/login_screen.dart';
import 'package:firebase_task/view/widgets/custom_botton.dart';
import 'package:firebase_task/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import '../widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
 AuthController controller = Get.put(AuthController());

 final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20.0, right: 20.0),
        child: ListView(
          children: [Form(
            key: _globalKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Welcome !!',
                          fontSize: 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                      text: 'Sign up Continue',
                      fontSize: 18,
                      color: tilleColor,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(text: 'UserName', hint: 'Farida',
                     validator: (val) {
                          return ValidatorDef.validatorname(val);
                        },
                   controller: controller.name,),
                  const SizedBox(height: 40,),

                  CustomTextFormField(
                      text: 'Email',
                      hint: 'example@email.com',
                       validator: (val) {
                          return ValidatorDef.validatorEmail(val);
                        }, controller: controller.email,),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Pssword',
                      hint: '********',
                        validator: (val) {
                          return ValidatorDef.validatorPassword(val);
                        },
                         controller: controller.password,),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomBtn(
                    text: 'Sign Up',
                    onTab: () async{
                      if(_globalKey.currentState!.validate()){
                        AuthController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: 'OR',
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(text: 'Have an account ?', fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
                      TextButton(onPressed: (){
                          Get.to(LoginScreen());
                      },
                          child:const Text('LogIn',style: TextStyle(color: secondColor, fontSize: 18, fontWeight: FontWeight.bold),)),
                    ],
                  )
                ]),
          ),
          ]
        ),
      ),
    );
  }
}
