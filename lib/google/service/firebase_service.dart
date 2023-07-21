import 'package:covid_tracker/google/model/firebase_model.dart';
import 'package:covid_tracker/navigation/app_navigation.dart';
import 'package:covid_tracker/utils/reusable_widgets.dart';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../notification/broadcast_notification.dart';
import '../../utils/date_time.dart';

class FirebaseService{
  final model = FirebaseModel();
  late final LocalNotificationService service;

  void createUser(String userEmail, String password,BuildContext context) async{
    await model.getAuth().createUserWithEmailAndPassword(
                    email: userEmail, 
                    password: password).then((value){
                      developer.log(value.user.toString());
                      navigateToLoginFromRegister(context);
                    }).onError((error, stackTrace){
                        developer.log("Error while registering: ${error.toString()})");
                        displayToast(context, "Error registering, check credentials!!!");
                    });           
  }

  void signInUser(String email, String password,BuildContext context) async{
    await model.getAuth().signInWithEmailAndPassword(
                    email: email,
                    password: password).then((value) async{
                                          developer.log("Logging user in!!");
                                          service = LocalNotificationService();
                                          await service.showNotifications(id: 0, 
                                                                    title: "Login Alert", 
                                                                    body: "${value.user?.email} has signed in on ${localNewYorkTime(value.user?.metadata.lastSignInTime)}");
                                          developer.log("Logged In User: ${value.user}"); 
                                          navigateToHomeFromLogin(context);
                                          })
                                       .onError((error, stackTrace) {
                                          developer.log("Error while signing in: ${error.toString()}");
                                          displayToast(context, "Error Signing In!!");
                                       });
  }

  Future<void> logout() async{
    await model.getAuth().signOut();
    developer.log("User has been signed out via firebase");
  }

  void signInUsingGoogle(String token){
    
  }
}