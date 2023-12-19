import 'dart:ffi';

import 'package:firebase_task/constance.dart';
import 'package:firebase_task/controller/home_controller.dart';
import 'package:firebase_task/controller/image_details_controller.dart';
import 'package:firebase_task/view/screens/add_upload_img.dart';
import 'package:firebase_task/view/screens/image_detiles.dart';
import 'package:firebase_task/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ViewImages extends StatelessWidget {
  final HomeController myController = Get.put(HomeController());
  final ImageDetailsController imageDetailsController = Get.put(ImageDetailsController());

  ViewImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Data'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          Get.offAll(()=>UploadImage());
        }, icon: const Icon(Icons.forward_outlined))],
      ),
      body: Center(
        child: Obx(() {
          if (myController.documents.isEmpty) {
            return  CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: myController.documents.length,
              itemBuilder: (context, index) {
                var data = myController.documents[index].data() as Map<String, dynamic>;
                // Use the data to display in your UI
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.network(data['image'])),
                      )),
                        const SizedBox(height: 20,),
                         CustomText(text: data['name'] , fontSize: 20, color: textColor, fontWeight: FontWeight.bold,alignment: Alignment.center,),

                   
                  ],
                );
             
              },
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myController.fetchData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
