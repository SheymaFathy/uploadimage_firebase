import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ImagesController extends GetxController{
  DateTime now = DateTime.now();
  var name = TextEditingController();
  var datecontroller = TextEditingController();
  String?x;
 
  Rx<File?> selectedImage = Rx<File?>(null);


  // image picker
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  //   .......................
  }


  // upload image to fb storge
  Future<void> uploadImage() async {
    try {
      final File imageFile = selectedImage.value!;
      final Reference storageRef = FirebaseStorage.instance.ref()
      .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(imageFile);
      final String downloadURL = await storageRef.getDownloadURL();
       // add data to firestore
       var date = "${name.text} - ${DateTime.now()}";
       Map <String,String>m_data = {
         "name":date ,
         "image": downloadURL,
       };
       CollectionReference images = FirebaseFirestore.instance.collection('images');
        Get.snackbar('Good ','The image has been uploaded successfully ' );

      return images.add(m_data).then((value) => print ("images added")).catchError((error)=>print("nooooooooooooooooooo"));

    } catch (error) {
      print('Error uploading image: $error');
    }
  } 
 }




