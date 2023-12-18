import 'package:firebase_task/controller/auth_controller.dart';
import 'package:firebase_task/helper/validation.dart';
import 'package:firebase_task/view/auth/sign_up.dart';
import 'package:firebase_task/view/screens/add_upload_img.dart';
import 'package:firebase_task/view/widgets/custom_botton.dart';
import 'package:firebase_task/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import '../widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
 AuthController authController = Get.put(AuthController());
 final formKey = GlobalKey<FormState>();
 TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();
 
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20.0, right: 20.0),
        child: ListView(
          children: [Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Welcome Back',
                          fontSize: 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                      text: 'Login To Continue',
                      fontSize: 18,
                      color: tilleColor,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                      text: 'Email',
                      hint: 'example@email.com',
                       validator: (val) {
                          return ValidatorDef.validatorEmail(val);
                        },
                      controller: email,),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Pssword',
                      hint: '********',
                       validator: (val) {
                          return ValidatorDef.validatorPassword(val);
                        }, controller: password,),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomBtn(
                    text: 'Sign In',
                    onTab: () async{

                    if(formKey.currentState!.validate()){
                        var signin = await authController.logInWithEmailAndPassword(
                                email.text, password.text);
                                signin == true ? Get.offAll(uploadImage()):Get.snackbar("خطأ",
                                  "تم ادخال اسم المستخدم او كلمة المرور بشكل خاطئ");
   
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
                      const CustomText(text: 'Do not have account? ', fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
                      TextButton(onPressed: (){
                          Get.to(SignUpScreen());
                      },
                          child:const Text('SignUp',style: TextStyle(color: secondColor, fontSize: 18, fontWeight: FontWeight.bold),)),
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
