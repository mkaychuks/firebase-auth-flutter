import 'package:auth_tutorial/provider/authentication/registration_provider.dart';
import 'package:auth_tutorial/utils/router/app_route_constants.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/snackbar.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:auth_tutorial/widgets/button.dart';
import 'package:auth_tutorial/widgets/input_fields.dart';
import 'package:auth_tutorial/widgets/textspans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        leading: InkWell(
          onTap: () {
            goToNextPageAndBack(context, MyAppRouteConstants.loginRouteName);
          },
          child: Image.asset(
            "assets/icons/backicon.png",
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 21.h),

              // the register text
              Text("Register",
                  style: CustomTextStyle.bold32
                      .copyWith(color: Theme.of(context).primaryColor)),
              SizedBox(height: 19.h),
              RichText(
                text: TextSpan(
                  text: "Create an",
                  style:
                      CustomTextStyle.regular16.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: " account",
                      style: CustomTextStyle.regularBold16
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(
                      text: " access all the \nfeatures of",
                      style: CustomTextStyle.regular16
                          .copyWith(color: Colors.black),
                    ),
                    TextSpan(
                      text: " Maxpense!",
                      style: CustomTextStyle.regularBold18
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),

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
                validator: (value) {
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!) &&
                      value.isEmpty) {
                    showSnackBar(context, "empty email field or email invalid",
                        Colors.redAccent);
                  }
                  return null;
                },
              ),
              SizedBox(height: 28.h),
              customInputField(
                context: context,
                labelText: "Your name",
                hintText: "Ex: Saul Ramirez",
                prefixIcon: SizedBox(
                  height: 19.18.h,
                  width: 19.2.w,
                  child: Image.asset("assets/icons/person.png"),
                ),
                controller: nameController,
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
                obscureText: true,
              ),

              // register button
              SizedBox(height: 60.h),
              Consumer<RegistrationProvider>(
                builder: (context, provider, child) {
                  return customButton(
                    context: context,
                    title: "Register",
                    isActive: provider.isLoading,
                    onTap: () async {
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();
                      var name = nameController.text.trim();
                      if (formKey.currentState!.validate()) {
                        provider
                            .registerUser(
                          email: email,
                          password: password,
                          fullName: name,
                          context: context,
                        )
                            .then(
                          (value) {
                            emailController.clear();
                            passwordController.clear();
                            nameController.clear();
                          },
                        );
                      }
                    },
                  );
                },
              ),

              // the text span
              SizedBox(height: 40.h),
              textSpanWidget(
                context: context,
                firstTitle: "Already have an account? ",
                secondTitle: "Login",
                onTap: () {
                 popPageFromStack(context);
                },
              )
              // the text spans.
            ],
          ),
        ),
      ),
    );
  }
}
