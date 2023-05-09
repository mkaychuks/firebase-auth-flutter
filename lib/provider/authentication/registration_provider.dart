import 'package:auth_tutorial/helpers/shared_pref.dart';
import 'package:auth_tutorial/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  // setters
  bool _isLoading = false; // handles the loading circular bar

  // getters
  bool get isLoading => _isLoading; // is loading state
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // for my signup and sign out

// handles the registration of users in firebase
  Future registerUser({
    required String email,
    required String password,
    required String fullName,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    await AuthenticationMethods(_auth)
        .signUpUserWithEmail(email: email, password: password, context: context)
        .then(
      (value) {
        _isLoading = false;
        notifyListeners();
        SharedPrefHelperFunction.saveUserFullName(fullName);
        AuthenticationMethods(_auth).sendVerificationEmail();
      },
    );
  }

  // check the status of the verificatio of email..
  Future<dynamic> checkEmailVerificationStatus(BuildContext context) async {
    return await AuthenticationMethods(_auth)
        .checkEmailVerificationStatus(context: context, ctx: context);
  }

  // google sign-in
  Future<void> signInWithGoogleStatus(BuildContext context) async {
    return await AuthenticationMethods(_auth).signInWithGoogle(context).then(
          (value) => SharedPrefHelperFunction.saveLoggedInState(true),
        );
  }
}
