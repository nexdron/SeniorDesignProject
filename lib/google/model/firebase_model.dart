import 'package:firebase_auth/firebase_auth.dart';

class FirebaseModel{

  FirebaseAuth getAuth(){
    return FirebaseAuth.instance;
  }

  User? getCurrentUser(){
    return getAuth().currentUser;
  }

  String? getCurrentUserUid(){
    return getAuth().currentUser?.uid;
  }
}