import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_task/controller/auth_controller.dart';
import 'package:firebase_task/controller/images_controller.dart';
import 'package:firebase_task/helper/My%20appfunction.dart';
import 'package:firebase_task/view/screens/view_img_screen.dart';
import 'package:firebase_task/view/widgets/custom_botton.dart';
import 'package:firebase_task/view/widgets/custom_text_form_field.dart';
import 'package:firebase_task/view/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../helper/validation.dart';


// ignore: must_be_immutable, camel_case_types
class UploadImage extends StatelessWidget {
   UploadImage({
    super.key,
  });

   ImagesController imgController = Get.put(ImagesController());
   AuthController controller =Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Uploud Images',),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
        controller.signout();
      }, icon: const Icon(Icons.logout))]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () =>   SizedBox(
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                  child: PickImageWidget(
                    function: () async {
                      await imgController.pickImage();
                    },
                    pickedImage:imgController.selectedImage.value,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
               text: 'Image Name',
               hint: 'logo.png',
               validator: (val) {
                 return ValidatorDef.validatorImgName(val);
               },
              controller: imgController.name,),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
               CustomBtn(text: "Upload Image", onTab: ()async{
              await imgController.uploadImage().then((value) =>
             Get.offAll(()=>ViewImages())
              );
            }),

            ]
                )
              ),
      ),

    );
    
  }
}

