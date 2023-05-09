import 'package:auth_tutorial/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget continueWithGoogle({
  required void Function()? onTap,
  BuildContext? context
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 345.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1, color: Colors.black)
      ),
      // alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h,width: 24.w,child: Image.asset("assets/images/google.png")),
          SizedBox(width: 10.w,),
          Text("Continue with Google", style: CustomTextStyle.regularBold16,),
        ],
      ),
    ),
  );
}