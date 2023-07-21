
import 'package:flutter/material.dart';

import '../../../utils/reusable_widgets.dart';
import '../../home/screen/fragments/landing_home_fragment/home_screen.dart';
import '../../login/screens/login_activity.dart';
import '../screens/splash_screens.dart';

//splash state for initial splash screen
class InitialSplashState extends State<InitialSplashScreen> {
   @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginActivity()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return progressiveLoading("Stay up to date...",true);
    }
}

// splash state for loading screen while logging in
class LoadingSplashLoginState extends State<LoadingSplashLogin> {
   @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return progressiveLoading("Logging in....",false);
    }
}

// splash state for loading screen while registering user
class LoadingSplashRegisterState extends State<LoadingSplashRegister> {
   @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginActivity()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return progressiveLoading("Hang tight while we register you!!....",false);
    }
}
