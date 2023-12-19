import 'package:firebase_task/controller/image_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImageDetailsScreen extends StatelessWidget {
  ImageDetailsController imageDetailsController = Get.put(ImageDetailsController());
  final ImageDetails image , name;
  
 ImageDetailsScreen({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image as String),
            Text(
              'Name: $name ',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
