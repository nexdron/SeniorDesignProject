import 'package:covid_tracker/google/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/reusable_widgets.dart';
import '../screens/register_screen.dart';

class RegisterActivityState extends State<RegisterActivity> {
  @override
  void initState(){
    super.initState();
  }
  
  final TextEditingController _setFullNameController        = TextEditingController();
  final TextEditingController _setEmailController           = TextEditingController();
  final TextEditingController _setPwController              = TextEditingController();
  final TextEditingController _setConfirmPwController       = TextEditingController();

  final FirebaseController _firebaseController              = FirebaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
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
              customTextField("Full Name", Icons.switch_account, false, _setFullNameController),
              const SizedBox(height: 20),
              customTextField("Email", Icons.email, false, _setEmailController),
              Lottie.network('https://assets9.lottiefiles.com/packages/lf20_9cyyl8i4.json',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: 20,
              ),
              customTextField("Password", Icons.lock, true, _setPwController),
              const SizedBox( height: 20),
              customTextField("Confirm Password", Icons.lock, true, _setConfirmPwController),
              const SizedBox(height: 160),
              customButton(context,() {
                _firebaseController.createUser(_setEmailController.text.trim(), 
                                               _setPwController.text.trim(),
                                               context);
              },true,false),
            ],
          ),
        ),
      ),
    )
  ); 
  }

    @override
  void dispose() {
    _setEmailController.dispose();
    _setFullNameController.dispose();
    _setPwController.dispose();
    _setConfirmPwController.dispose();
    super.dispose();
  }
}