import 'package:auth_tutorial/provider/authentication/login_provider.dart';
import 'package:auth_tutorial/provider/authentication/registration_provider.dart';
import 'package:auth_tutorial/utils/router/app_route_constants.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/button.dart';
import 'package:auth_tutorial/widgets/continue_with_google.dart';
import 'package:auth_tutorial/widgets/input_fields.dart';
import 'package:auth_tutorial/widgets/textspans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

            // the login text
            Text("Login",
                style: CustomTextStyle.bold32
                    .copyWith(color: Theme.of(context).primaryColor)),
            SizedBox(height: 19.h),
            Text("Login now to track all your expenses\nand income at a place!",
                style: CustomTextStyle.regular16),

            // the textfields
            SizedBox(height: 40.h),
            customInputField(
              context: context,
              labelText: "Email",
              hintText: "Ex: abc@example.com",
              prefixIcon: SizedBox(
                height: 19.18.h,
                width: 19.2.w,
                child: Image.asset("assets/images/at.png"),
              ),
              controller: emailController,
            ),
            SizedBox(height: 28.h),
            customInputField(
                context: context,
                labelText: "Your Password",
                hintText: "********",
                prefixIcon: SizedBox(
                  height: 19.h,
                  width: 16.9.w,
                  child: Image.asset("assets/icons/lock.png"),
                ),
                controller: passwordController,
                obscureText: true),

            // forgot password
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                goToNextPageAndBack(
                    context, MyAppRouteConstants.resetRouteName);
              },
              child: Text(
                "Forgot Password?",
                style: CustomTextStyle.regular12.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),

            // login button
            SizedBox(height: 28.h),
            Consumer<LoginProvider>(builder: (context, logProvider, _) {
              return customButton(
                isActive: logProvider.isLoading,
                context: context,
                title: "Login",
                onTap: () async {
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  logProvider
                      .loginUser(
                          email: email, password: password, context: context)
                      .then(
                    (value) {
                      emailController.clear();
                      passwordController.clear();
                    },
                  );
                },
              );
            }),

            //the divider
            SizedBox(height: 28.h),
            const Divider(
              height: 1,
              color: Color(0xFF000000),
            ),

            //continue with google button
            SizedBox(height: 28.h),
            Consumer<RegistrationProvider>(
              builder: (context, snapshot, _) {
                return continueWithGoogle(
                  context: context,
                  onTap: () async {
                    snapshot.signInWithGoogleStatus(context);
                  },
                );
              },
            ),

            // the text span
            SizedBox(height: 40.h),
            textSpanWidget(
              context: context,
              firstTitle: "Don't have an account? ",
              secondTitle: "Register",
              onTap: () {
                goToNextPageAndBack(
                    context, MyAppRouteConstants.registerRouteName);
              },
            )
            // the text spans.
          ],
        ),
      ),
    );
  }
}
