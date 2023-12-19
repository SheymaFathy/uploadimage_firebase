
class ValidatorDef {
  static String? validatorEmail(val) {
    if (val == null || val.isEmpty) {
      return "Please write your Email";
    }
    return null;
  }

  static String? validatorPassword(val) {
    if (val == null || val.isEmpty) {
      return "Please write your Password";
    }
    return null;
  }

  static String? validatorname(val) {
    if (val == null || val.isEmpty) {
      return "Please write your User Name";
    }
    return null;
  }



  static String? validatorImgName(val) {
    if (val == null || val.isEmpty) {
      return "Please write name of image";
    }
    return null;
  }
}
