import 'package:auth_tutorial/provider/authentication/login_provider.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Text("You can log out...", style: CustomTextStyle.regular17_32),
            SizedBox(height: 18.h),

            // the two buttons
            Consumer<LoginProvider>(
              builder: (context, snapshot, _) {
                return customButton(
                  context: context,
                  title: "Logout",
                  isActive: snapshot.isLoading,
                  onTap: () async {
                    snapshot.signOutUser(context);
                  },
                );
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
