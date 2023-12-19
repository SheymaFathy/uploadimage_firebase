import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<DocumentSnapshot> documents = <DocumentSnapshot>[].obs;

  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('images').get();
      documents.value = querySnapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}

