import 'package:auth_tutorial/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget continueWithEmail({
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
          Text("Continue with Phone", style: CustomTextStyle.regularBold16,),
          SizedBox(width: 10.w,),
          SizedBox(height: 19.18.h,width: 19.2.w,child: Image.asset("assets/images/at.png")),
        ],
      ),
    ),
  );
}