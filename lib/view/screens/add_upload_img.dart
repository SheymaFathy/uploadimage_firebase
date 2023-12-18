import 'package:firebase_task/controller/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class uploadImage extends StatelessWidget {
   uploadImage({
    super.key,
  });
  ImagesController imgController = Get.put(ImagesController());
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => imgController.selectedImage.value != null
                  ? Image.file(
                      imgController.selectedImage.value!,
                      height: 200,
                    )
                  : Container(),
            ),
            ElevatedButton(
              onPressed: () async {
                await imgController.pickImage();
              },
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await imgController.uploadImage();
              },
              child: const Text('Upload Image to Firebase Storage'),
            ),
          ],
        ),
      ),






      // ..............................................
      // body:  Padding(
      //   padding:  const EdgeInsets.only(right: 15.0, left: 15.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [    
      //     Obx(() => 
      //     CircleAvatar(
      //       maxRadius: 200.0,
      //       backgroundImage: 
       
      //       imgController.imagePath.isNotEmpty?
      //       FileImage(File(imgController.imagePath.toString())) :
      //     null  
      //    ),

      //    ),
      //    CustomBtn(text: 'Choose Image From Gallery', onTab: ()async{
      //         await imgController.pickImage();
      //       }),
      //     const  SizedBox(height: 20,),
      //                CustomBtn(text: 'Upload Selected Image', onTab: ()async{
      //         await imgController.uploadSelectesImage();
      //       }),
      //     ],
      //   ),
      // ),
       
        );
     
  }
}

