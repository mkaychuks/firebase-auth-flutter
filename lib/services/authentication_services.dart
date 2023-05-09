import 'dart:io';

import 'package:auth_tutorial/utils/router/app_route_constants.dart';
import 'package:auth_tutorial/utils/routes.dart';
import 'package:auth_tutorial/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationMethods {
  final FirebaseAuth _auth;

  AuthenticationMethods(this._auth);

  // the registration service
  Future<void> signUpUserWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => showSnackBar(
                context, "Verification email sent", Colors.blueAccent),
          );
      if(context.mounted) goToNextPageAndBack(context, MyAppRouteConstants.verificationRouteName);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showSnackBar(context, "Password is weak", Colors.redAccent);
      } else if (e.code == "email-already-in-use") {
        showSnackBar(context, "Email incorrect", Colors.redAccent);
      }
      showSnackBar(context, "An error occured", Colors.redAccent);
    } on SocketException {
      showSnackBar(context, "Internet connection is needed", Colors.redAccent);
    }
  }

  // EMAIL VERIFICATION
  // a function that call send email verification stuff.....
  Future<void> sendVerificationEmail() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  // CHECK EMAIL VERIFICATION STATUS
  // check the status of the verificatio of email..
  Future checkEmailVerificationStatus(
      {BuildContext? context, BuildContext? ctx}) async {
    await _auth.currentUser?.reload();

    var status = _auth.currentUser!.emailVerified;
    if (status) {
      showSnackBar(context!, "Email Verified successfully", Colors.green);
      if(context.mounted) goToPageAndRemoveFromStack(context, MyAppRouteConstants.loginRouteName);
    } else {
      showSnackBar(context!, "Please verify your email", Colors.redAccent);
    }
    return status;
  }

  // HANDLING USER LOGIN AND LOGOUT..
  Future<void> loginUserWithEmail({
    required BuildContext? context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendVerificationEmail().then(
          (value) {
            showSnackBar(
                context!, "Email Verification link sent", Colors.amber);
          },
        );
      }
      goToPageAndRemoveFromStack(context!, MyAppRouteConstants.homeRouteName);
      if(context.mounted) showSnackBar(context, "Login successfull", Colors.green);
    } on FirebaseAuthException catch (_) {
      showSnackBar(context!, "email or password does not exist", Colors.red);
    }
  }

  // GOOGLE SIGN-IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        await _auth.signInWithCredential(credential);
        if(context.mounted) goToPageAndRemoveFromStack(context, MyAppRouteConstants.homeRouteName);
        if(context.mounted) showSnackBar(context, "Sign-in successful", Colors.green);
      }
    } on FirebaseAuthException catch (_) {
      showSnackBar(context, "Something went wrong", Colors.red);
    } on SocketException {
      showSnackBar(context, "Internet lost", Colors.red);
    }
  }


  // SIGN-OUT
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
  }

  // RESET PASSWORD
  Future<void> resetPassword(BuildContext context, String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) => showSnackBar(context, "Password reset email sent", Colors.greenAccent));
    if(context.mounted) goToPageAndRemoveFromStack(context, MyAppRouteConstants.loginRouteName);
  }
}
