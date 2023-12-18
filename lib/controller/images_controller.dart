import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagesController extends GetxController{

  Rx<File?> selectedImage = Rx<File?>(null);
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
     
    }
  }




  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      return;
    }

    try {
      final File imageFile = selectedImage.value!;
      final Reference storageRef = FirebaseStorage.instance.ref()
      .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(imageFile);
      final String downloadURL = await storageRef.getDownloadURL();
      
    Get.snackbar('Good ','The image has been uploaded successfully ' );
    
    } catch (error) {
      print('Error uploading image: $error');
    }
  }





// ............................................................
  // Rx<String> imagePath =''.obs;
  // Future pickImage()async{
  //   final ImagePicker picker = ImagePicker();
  //   final image = await picker.pickImage(source:ImageSource.gallery);
  //   if (image!= null){
  //     imagePath.value = image.path;
  //   }
  // }



// Future uploadSelectesImage()async{
// Reference refStorage = FirebaseStorage.instance.ref('1.jpg');
// await refStorage.putFile(imagePath.value as File);
// }

// .......................................................

//  Future uploadImageToFb()async{
//   String fileName = DateTime.now().minute.toString();
//   try{
//     Reference reference = FirebaseStorage.instance.ref().child('mypicture/$fileName.png');
//     await reference.putFile(imagePath.value as File);

//     String downloadUrl = await reference.getDownloadURL();
//     return downloadUrl;
//   }catch(e){
//     Get.snackbar("nooooo","$e");
//   }

//  }
 }




