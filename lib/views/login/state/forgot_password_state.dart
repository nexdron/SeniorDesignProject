import 'package:covid_tracker/navigation/app_navigation.dart';
import 'package:covid_tracker/views/login/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/reusable_widgets.dart';

class ForgotPaswswordState extends State<ForgotPaswsword>{

  @override
  void initState(){
    super.initState();
  }

final TextEditingController _setNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 20 ,0),
          child: Column(
                    children: <Widget> [
                    customTextField("Your Email Here", Icons.email, false, _setNewPasswordController),
                    const SizedBox(height: 5,),
                    ElevatedButton(
                        onPressed: () => {
                          if(_setNewPasswordController.text.trim().isEmpty)
                          {
                            displayToast(context, "Email body cannot be empty.")
                          }
                          else if(isValidEmail(_setNewPasswordController.text.trim()))
                          {
                            showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                            title: const Text("Polls"),
                            content: Wrap(
                            children: [
                              Lottie.network('https://assets8.lottiefiles.com/packages/lf20_y9qOnk.json'),
                              Text("An email has been sent to ${_setNewPasswordController.text.trim()}. Please check your inbox. If you don't see an email check your spam as well."),
                              ]
                            ),
                    actions: <Widget>[
                    TextButton(
                    onPressed: () => navigateToLoginFromForgetPassword(context),
                    child: const Text('Done'),
            ),
          ],
        ),
      )
                          }
                          else
                          {
                            displayToast(context, "Invalid Email or Email not found in database.")
                          }
                         },
                        child: const Text('Send Email'),
                        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    )
                            ],
        ),
        )
      )
    ); 
  }
}

bool isValidEmail(String email)
{
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
               .hasMatch(email);
}