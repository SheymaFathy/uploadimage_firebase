import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ImageDetails {
  final String id;
  final String name;
  final String image;

  ImageDetails({
    required this.id,
    required this.name,
    required this.image,
  });
}
class ImageDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<ImageDetails> myimage = <ImageDetails>[].obs;

  Future<void> fetchImage() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('images').get();
      myimage.value = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return ImageDetails(
          id: doc.id,
          name: data['name'],
          image: data['image'],
        );
      }).toList();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
