import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_tracker/navigation/app_navigation.dart';
import 'package:covid_tracker/utils/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key:key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{

  @override
    void initState(){
      super.initState();
    }

  CollectionReference delete_request = FirebaseFirestore.instance.collection('delete_request');
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Account Information',textAlign: TextAlign.center,),
            onTap: () => {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => showPopUp("Account Info", " Full Name: ${auth.currentUser!.displayName} \n User Id: ${auth.currentUser!.uid.substring(0,5)}...... \n Email: ${auth.currentUser!.email} \n Password: *************", context)
              )
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Developers',textAlign: TextAlign.center),
            onTap: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => showPopUp("Our team","\n Subin Neupane - Lead Developer \n Selina Narain - Product Owner \n Victor Haslett - Project Manager \n Neelam Boywah - Lead UI \n Munkasir Mir - Developer \n Stanley Chen - Support", context)
              );
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Data and Privacy',textAlign: TextAlign.center),
            onTap: (){
              final Uri _url = Uri.parse('https://www.apple.com/legal/privacy/data/en/app-store/');
              launchInBrowser(_url);
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Delete your account',textAlign: TextAlign.center),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                          title: const Text("Account Deletion !!!"),
                          content: const Text("Are you sure you want to delete your account?"),
                          actions: <Widget>[
                          TextButton(
                                  onPressed: () async {
                                       delete_request
                                              .doc('delete_requests')
                                              .set({
                                              'user_id':auth.currentUser!.uid,
                                              'flag': 1
                                              })
                                              .then((value) => print("Delete Flag sent."))
                                              .catchError((error) => print("Failed to send delete flag ${error.toString()}"));

                                              auth.currentUser!.delete();
                                              navigateToLoginFromHome(context);
                                  },
                                  child: const Text('Yes'),
                          ),
                          TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('No'),
                          ),
                  ],
              )
              );
            },
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
  
}

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }