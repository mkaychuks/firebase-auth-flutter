import 'package:auth_tutorial/helpers/shared_pref.dart';
import 'package:auth_tutorial/utils/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        SharedPrefHelperFunction.getLoggedInState(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "MaxPense",
          style: CustomTextStyle.bold40
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
