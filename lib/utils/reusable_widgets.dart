import 'package:covid_tracker/utils/color_utils.dart';
import 'package:covid_tracker/views/login/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

TextField customTextField(String text, IconData icon, bool shouldEncrypt, TextEditingController controller)
{
  return TextField(

      controller: controller,
      obscureText: shouldEncrypt,
      enableSuggestions: !shouldEncrypt,
      autocorrect: !shouldEncrypt,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(prefixIcon: Icon(icon, color: Colors.white70,),
                                  labelText: text,
                                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                                  filled: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  fillColor: Colors.black.withOpacity(0.3),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
                                                             borderSide: const BorderSide(
                                                                width: 0,
                                                                style: BorderStyle.none
                                                             )),
      ),
      keyboardType: shouldEncrypt ? TextInputType.visiblePassword
                                  : TextInputType.emailAddress,
  );
}

Container customButton(BuildContext context, 
                      Function onTap, 
                      bool isElevatedBtn, 
                      bool isElevatedBtnTxt)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0,10,0,20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: isElevatedBtn ? 
    ElevatedButton(                  //first case if button is a login button
      onPressed: () {
        onTap();
      },
      child:Text(
        isElevatedBtnTxt ? "Sign In"
                         : "Register",
        style: const TextStyle(
        color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.pressed)){
          return hexStringToColor("00A699");
        }
        else{
          return hexStringToColor("FF5A5F");
        }
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
    )
    :                                                 //else its a text button
    TextButton(
      child: const Text("Sign Up Here", 
                        style: TextStyle(fontSize: 15, 
                                        decoration: TextDecoration.underline, 
                                        color: Colors.black),
                    ),
      onPressed: (){
          Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const RegisterActivity())));
                        },
    )
  ); 
}

Widget progressiveLoading(String loadingTitle, bool isInitialSplash){
  return Scaffold(
      backgroundColor: isInitialSplash ? Colors.white
                                       : const Color.fromARGB(255, 133, 131, 244),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: isInitialSplash ? Lottie.network('https://assets5.lottiefiles.com/packages/lf20_ebj4mazi.json')
                                       : Lottie.network('https://assets7.lottiefiles.com/private_files/lf30_ed0rdvno.json')),
            const SizedBox(height: 10),
                  Text(loadingTitle,
                       style:const TextStyle(fontSize: 18, 
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                      ),
                    ],
                  ),
              ),
          );
}

void displayToast(BuildContext context, String message)
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
}

void onLoading(BuildContext context, String displayText) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            Text(displayText,textAlign: TextAlign.center),
          ],
        ),
      );
    },
  );
}

AlertDialog showPopUp(String title, String body, BuildContext context)
{
  return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Close'),
            ),
          ],
        );
}