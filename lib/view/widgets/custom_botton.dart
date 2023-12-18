import 'package:flutter/material.dart';
import '../../constance.dart';
import 'custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, required this.onTab});
 final String text;
 final void Function() onTab;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: primaryColor,
        padding:const EdgeInsets.all(18.0) ,
        onPressed:onTab,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key,  this.text='Sign in With Google', required this.onTab});
  final String text;
  final void Function() onTab;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        padding:const EdgeInsets.all(18.0) ,
        onPressed:onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google.png', width: 20,),
            const SizedBox(width: 20,),
            CustomText(
              text: text,
              alignment: Alignment.center,
              fontSize: 20,
              color: tilleColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
