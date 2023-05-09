import 'package:auth_tutorial/provider/authentication/login_provider.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/button.dart';
import 'package:auth_tutorial/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

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
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),

            // forgot password text
            Text(
              "Forgot Password",
              style: CustomTextStyle.bold32
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 19.h),
            Text(
              "Recover you password if you have\nforgot the password!",
              style: CustomTextStyle.regular16,
            ),

            // the email input field
            SizedBox(height: 55.h),
            customInputField(
              context: context,
              labelText: "Email",
              hintText: "Ex: abc@example.com",
              controller: emailController,
              prefixIcon: SizedBox(
                height: 19.18.h,
                width: 19.2.w,
                child: Image.asset("assets/images/at.png"),
              ),
            ),

            // the button
            SizedBox(height: 28.h),
            Consumer<LoginProvider>(
              builder: (context, snapshot, _) {
                return customButton(
                  isActive: snapshot.isLoading,
                  context: context,
                  title: "Submit",
                  onTap: () async {
                    var email = emailController.text.trim();
                    snapshot.resetPassword(context, email);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
