import 'package:auth_tutorial/utils/router/app_route_constants.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelperFunction {
  static String userFullNameKey = "USERFULLNAMEKEY";
  static String isUserLoggedIn = 'USERLOGGEDINkEY';

  static Future<bool?> saveUserFullName(String fullName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userFullNameKey, fullName);
  }

  static Future<bool?> saveLoggedInState(bool status) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(isUserLoggedIn, status);
  }

  static getLoggedInState(BuildContext context) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final bool? repeat = sf.getBool(isUserLoggedIn);
    if (repeat == true) {
      if(context.mounted) goToPageAndRemoveFromStack(context, MyAppRouteConstants.homeRouteName);
    } else if(repeat == false || repeat == null){
      if(context.mounted) goToPageAndRemoveFromStack(context, MyAppRouteConstants.loginRouteName);
    }
  }
}
