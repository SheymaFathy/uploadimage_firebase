class SignUpExeption {
  final String message;
  const SignUpExeption([this.message = "An Unkown error!!"]);
   factory SignUpExeption.code(String code){
    switch(code){
      case 'weak-password':
      return const SignUpExeption('Please enter strong password!');
      case 'invalid-email':
      return const SignUpExeption('Email is not valid!');
      case 'email-already-in-use':
      return const SignUpExeption('An account already exists for that email');
      case 'operation-not-allowed':
      return const SignUpExeption('Operation is not allowed. Please contact support.');
      case 'user-disabled':
      return const SignUpExeption('This User has been disabled. Please contact support for help.');

    }
    return const SignUpExeption();
   }
}


class SignInExeption {
   final String message;
  const SignInExeption([this.message = "An Unkown error!!"]);
   factory SignInExeption.code(String code){
    switch(code){
      case 'user-not-found':
      return const SignInExeption('No user found for that email!');
      case 'wrong-password':
      return const SignInExeption('Wrong password, Please write the correct password!');
    }
    return const SignInExeption();
   }
}