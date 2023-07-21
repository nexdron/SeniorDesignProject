import 'package:covid_tracker/local_auth/local_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../google/controller/firebase_controller.dart';
import '../../../../navigation/app_navigation.dart';
import '../../../../utils/reusable_widgets.dart';

Widget navigationDrawer(BuildContext context)
{

final FirebaseController _firebaseController = FirebaseController();

final Uri _url = Uri.parse('https://github.com/NSubin523/SeniorDesignProject');

  return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: SizedBox(
                child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_mdaxtkrq.json'),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person_crop_circle, color: Colors.black,),
              title: const Text('Profile',textAlign: TextAlign.center,),
              onTap: () {
                navigateToUserProfileFromMenuDrawer(context);
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(CupertinoIcons.lock, color: Colors.black,),
              title: const Text('Enable Face ID',textAlign: TextAlign.center),
              onTap: ()async{
                final _faceIdAuth = await LocalAuth.authenticate();
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(CupertinoIcons.info_circle, color: Colors.black,),
              title: const Text('About Us',textAlign: TextAlign.center),
              onTap: (){
                _launchInBrowser(_url);
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.masks, color: Colors.black,),
              title: const Text('Preventive Measure',textAlign: TextAlign.center),
              onTap: () => {
                 showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                    title: const Text("Take these precautions"),
                    content: const Text("Take the vaccine and boosters (Pfizer, Moderna, Johnson & Johnson). \nWear a mask in public areas where Covid-19 cases are high. \nAvoid crowds and poorly ventilated areas.Monitor your health daily and test if you are unwell. \nHealth and hygiene practices (stay hydrated, get enough rest, wash your hands, avoid touching eyes, nose and mouth with unwashed hands, clean and disinfect your personal spaces frequently)"),
                    actions: <Widget>[
                    TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Go Back'),
            ),
          ],
        ),
      )
              }
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.black,),
              title: const Text('Polls',textAlign: TextAlign.center),
              onTap: () => {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                    title: const Text("Polls"),
                    content: Wrap(
                      children: [
                        Lottie.network('https://assets10.lottiefiles.com/datafiles/8UjWgBkqvEF5jNoFcXV4sdJ6PXpS6DwF7cK4tzpi/Check Mark Success/Check Mark Success Data.json'),
                        const Text("Your responses have been recoreded. Please come back later for new polls. \nPolls are refreshed every week. Come back later."),
                      ]
                    ),
                    actions: <Widget>[
                    TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Done'),
            ),
          ],
        ),
      )
              }
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 180),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black,),
              title: const Text('Sign Out',textAlign: TextAlign.center),
              onTap: () {
                _firebaseController.signOut();
                onLoading(context,"Logging Out!!");
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pop(context); //pop dialog
                  navigateToLoginFromHome(context);
                });
              },
            ),
          ],
        ),
      );
}

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }