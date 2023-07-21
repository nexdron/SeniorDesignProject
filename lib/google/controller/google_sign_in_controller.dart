import 'package:covid_tracker/google/service/google_sign_in_provider.dart';
import 'package:covid_tracker/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class GoogleSignInController{
  void signUserInWithGoogle(BuildContext context)
  {
    signInWithGoogle().then((value) => {
      if (value != null)
      {
        navigateToHomeFromLogin(context)
      }
    });
  }
}