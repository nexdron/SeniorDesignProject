import 'package:covid_tracker/google/service/firebase_service.dart';
import 'package:flutter/material.dart';

class FirebaseController{
  FirebaseService service = FirebaseService();

  void createUser(String email, String password,BuildContext context){
     service.createUser(email, password,context);
  }

  void login(String email, String password,BuildContext context){
    service.signInUser(email, password,context);
  }

  Future<void> signOut() async{
    await service.logout();
  }

  // Future<bool> isUserSignedIn() async{
    
  // }
}