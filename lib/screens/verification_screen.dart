import 'package:auth_tutorial/provider/authentication/registration_provider.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        leading: InkWell(
          onTap: () {
            popPageFromStack(context);
          },
          child: Image.asset(
            "assets/icons/backicon.png",
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),

            // the register text
            Text("Register",
                style: CustomTextStyle.bold32
                    .copyWith(color: Theme.of(context).primaryColor)),
            SizedBox(height: 19.h),

            Text(
                "We have sent an email to your email\naccount with a verification link!",
                style: CustomTextStyle.regular16),

            // continue button
            SizedBox(height: 58.h),
            Consumer<RegistrationProvider>(
              builder: (context, snapshot, _) {
                return customButton(
                  title: "Continue to Login",
                  onTap: () async {
                    snapshot.checkEmailVerificationStatus(context);
                  },
                  context: context,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
