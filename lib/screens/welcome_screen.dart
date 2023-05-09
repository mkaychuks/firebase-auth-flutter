import 'package:auth_tutorial/provider/authentication/registration_provider.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/continue_with_google.dart';
import 'package:auth_tutorial/widgets/textspans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/router/app_route_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 255.h),

            // the header of the welcome page
            Text("Welcome to", style: CustomTextStyle.regular24),
            SizedBox(height: 3.h),
            Text("MaxPense",
                style: CustomTextStyle.bold40
                    .copyWith(color: Theme.of(context).primaryColor)),
            SizedBox(height: 3.h),
            Text(
                "A place where you can track all your\nexpenses and incomes...",
                style: CustomTextStyle.regular16),

            // the welcome sentence
            SizedBox(height: 55.h),
            Text("Let’s Get Started...", style: CustomTextStyle.regular17_32),
            SizedBox(height: 18.h),

            // the two buttons
            Consumer<RegistrationProvider>(builder: (context, snapshot, _) {
              return continueWithGoogle(
                context: context,
                onTap: () async {
                  snapshot.signInWithGoogleStatus(context);
                },
              );
            }),
            SizedBox(height: 24.h),

            // the rich text
            textSpanWidget(
              context: context,
              firstTitle: "Already have an account? ",
              secondTitle: "Login",
              onTap: () {
                goToNextPageAndBack(
                    context, MyAppRouteConstants.loginRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
