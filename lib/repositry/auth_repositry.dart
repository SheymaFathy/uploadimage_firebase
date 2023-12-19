import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task/repositry/auth_exeption.dart';
import 'package:firebase_task/view/screens/add_upload_img.dart';
import 'package:firebase_task/view/screens/homeScreen.dart';
import 'package:get/get.dart';

class AuthRepositry extends GetxController{
static AuthRepositry get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseuser;

  @override 
  void onReady(){
    firebaseuser = Rx<User?>(_auth.currentUser);
    firebaseuser.bindStream(_auth.userChanges());
    ever(firebaseuser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(()=>  const HomeScreen()): Get.offAll(()=> UploadImage());
  }


  Future <void> createUserWithEmailAndPassword(String email, String password)async{
    try{
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseuser.value != null? Get.offAll(()=>  UploadImage()):Get.offAll(()=> const HomeScreen());
    }on FirebaseAuthException catch(e){
      final ex = SignUpExeption.code(e.code);
      Get.snackbar('FIREBASE AUTH EXCEPTION', ex.message);
      throw ex;
    }catch(_){
      const ex = SignUpExeption();
       Get.snackbar('EXCEPTION', ex.message);
    }
     
}

  void signInWithEmailAndPassword(String email, String password)async {
    try {
   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
   firebaseuser.value != null? Get.offAll(()=>  UploadImage()):Get.offAll(()=> const HomeScreen()); 
} on FirebaseAuthException catch (e) {
  final loginexcption = SignInExeption.code(e.code);
   Get.snackbar('FIREBASE AUTH EXCEPTION', loginexcption.message);
}catch(_){
    const loginexcption = SignUpExeption();
    Get.snackbar('EXCEPTION', loginexcption.message);
}
  }}