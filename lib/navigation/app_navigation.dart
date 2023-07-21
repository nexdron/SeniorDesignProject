import 'package:covid_tracker/views/home/screen/partials/profile_screen.dart';
import 'package:covid_tracker/views/login/screens/forgot_password_screen.dart';
import 'package:covid_tracker/views/login/screens/register_screen.dart';
import 'package:covid_tracker/views/splash/screens/splash_screens.dart';
import 'package:flutter/material.dart';

import '../views/login/screens/login_activity.dart';

//login navigation controller
void navigateToLoginFromHome(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const LoginActivity()));
}

//registration navigation controller
void navigateToRegisterFromLogin(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const RegisterActivity()));
}

//home page navigation controller
void navigateToHomeFromLogin(BuildContext context)
{
 Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const LoadingSplashLogin()));
}

//after finishing registration navigate back to login
void navigateToLoginFromRegister(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const LoadingSplashRegister()));
}

//navigate to profile page from navigation drawer menu
void navigateToUserProfileFromMenuDrawer(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const ProfileScreen()));
}

void navigateToForgetPassword(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const ForgotPaswsword()));
}

void navigateToLoginFromForgetPassword(BuildContext context)
{
  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const LoginActivity()));
}
