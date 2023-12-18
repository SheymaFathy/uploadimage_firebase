import 'package:firebase_task/constance.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<dynamic>signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

Future<dynamic> signUp(String email ,String password)async{
try {
 await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
   if (e.code == 'email-already-in-use') {
     Get.snackbar('Error', 'The account already exists for that email.',
      colorText: primaryColor, snackPosition:SnackPosition.BOTTOM );
  }
}
}


  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }



Future logInWithEmailAndPassword(
  String email ,String password
)async{

 try {
   await _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
 } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    Get.snackbar('Error', e.toString(), colorText: primaryColor, snackPosition:SnackPosition.BOTTOM );
  } else if (e.code == 'wrong-password') {
    Get.snackbar('Error', e.toString(), colorText: primaryColor, snackPosition:SnackPosition.BOTTOM );
  }
}
}
  
}


   
