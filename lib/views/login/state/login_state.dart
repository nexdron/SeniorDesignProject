import 'package:covid_tracker/google/controller/firebase_controller.dart';
import 'package:covid_tracker/google/controller/google_sign_in_controller.dart';
import 'package:covid_tracker/navigation/app_navigation.dart';
import 'package:covid_tracker/notification/broadcast_notification.dart';
import 'package:covid_tracker/utils/color_utils.dart';
import 'package:covid_tracker/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../screens/login_activity.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginActivityState extends State<LoginActivity> {

  late final LocalNotificationService service;

  @override
  void initState(){
    service = LocalNotificationService();
    service.initNotification();
    super.initState();
  }

  final TextEditingController _emailController          = TextEditingController();
  final TextEditingController _passwordController       = TextEditingController();

  final FirebaseController      _firebaseController     = FirebaseController();
  final GoogleSignInController  _googleSignInController = GoogleSignInController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("e6e6fa"),   // silver
              hexStringToColor("f2f2fc"),   // white smoke
              hexStringToColor("FFFFFF")    // white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 20 ,0),
          child: Column(
            children: <Widget>[
              Lottie.network('https://assets10.lottiefiles.com/packages/lf20_txatrk7c.json',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: 340,
              ),
              const SizedBox(height: 40),
              customTextField("Email", Icons.email, false, _emailController),
              const SizedBox( height: 20),
              customTextField("Password", Icons.lock, true, _passwordController),
              const SizedBox(height: 10),
              customButton(context,(){
                _firebaseController.login(_emailController.text.trim(), 
                                          _passwordController.text.trim(), 
                                          context);
              },true,true),
              TextButton(
                  onPressed: () => navigateToForgetPassword(context), 
                  child: const Text(
                      "Forgot password", 
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                             color: Colors.black, 
                             decoration: TextDecoration.underline
                            ),
                          )
                        ),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  _googleSignInController.signUserInWithGoogle(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                ),
              SignInButton(
                Buttons.AppleDark,
                onPressed: () {
                 displayToast(context, "got it");
                },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
                ),
                ),
                customButton(context,() {
                navigateToRegisterFromLogin(context);
              },false,true),
            ],
          ),
        ),
      ),
    )
  ); 
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

