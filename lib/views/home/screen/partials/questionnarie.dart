import 'package:covid_tracker/views/home/screen/partials/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/reusable_widgets.dart';

class Screening extends StatefulWidget{
  const Screening({Key? key}) : super(key: key);


  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vaccines")),
      drawer: navigationDrawer(context),
      body: ListView(
      children: <Widget>[
      Card(
          child: ListTile(
          leading: const Icon(Icons.vaccines_sharp),
          title: const Text('Pfizer-Biontech'),
          subtitle: const Text(
                'Type: mRNA \nFDA Aprroved: Yes \nCategory: Covid-19'
                  ),
          trailing: const Icon(Icons.check_circle, color: Colors.green,),
          isThreeLine: true,
          onTap: () {
             final Uri _url = Uri.parse('https://www.vaccines.gov/results/?zipcode=10007&medicationGuids=d0d2c703-1638-4623-85a8-d70c0da14dc7,25f1389c-5597-47cc-9a9d-3925d60d9c21,6e9b0945-9b98-4df4-8d10-c42f526eed14,a84fb9ed-deb4-461c-b785-e17c782ef88b&primaryGuids=d0d2c703-1638-4623-85a8-d70c0da14dc7,25f1389c-5597-47cc-9a9d-3925d60d9c21,6e9b0945-9b98-4df4-8d10-c42f526eed14,a84fb9ed-deb4-461c-b785-e17c782ef88b&medicationKeys=pfizer_covid_19_vaccine_pediatric_range_2,pfizer_covid_19_vaccine_pediatric_range_1,pfizer_comirnaty_covid_19_vaccine,pfizer_covid_19_vaccine');
             launchInBrowser(_url);
          },
      ),
    ),
    Card(
          child: ListTile(
          leading: const Icon(Icons.vaccines_sharp),
          title: const Text('Moderna'),
          subtitle: const Text(
                'Type: mRNA \nFDA Aprroved: Yes \nCategory: Covid-19'
                  ),
          trailing: const Icon(Icons.check_circle, color: Colors.green,),
          isThreeLine: true,
          onTap: () {
              final Uri _url = Uri.parse('https://www.vaccines.gov/results/?zipcode=10007&medicationGuids=4d9af7f8-2acc-4ee2-b2cc-c5ebcfc12890,a2c89970-ea30-44bd-b024-e60ac906a05e,779bfe52-0dd8-4023-a183-457eb100fccc,cd62a2bb-1e1e-4252-b441-68cf1fe734e9&primaryGuids=4d9af7f8-2acc-4ee2-b2cc-c5ebcfc12890,a2c89970-ea30-44bd-b024-e60ac906a05e,779bfe52-0dd8-4023-a183-457eb100fccc,cd62a2bb-1e1e-4252-b441-68cf1fe734e9&medicationKeys=moderna_covid_19_vaccine_pediatric_range_2,moderna_covid_19_vaccine_pediatric_range_0,moderna_covid_19_vaccine,moderna_spikevax_covid_19_vaccine');
              launchInBrowser(_url);
          },
      ),
    ),
    Card(
          child: ListTile(
          leading: const Icon(Icons.vaccines_sharp),
          title: const Text('Johnson & Johnson'),
          subtitle: const Text(
                'Type: Viral Vector Vaccine \nFDA Aprroved: No \nCategory: Covid-19'
                  ),
          trailing: const Icon(Icons.close, color: Colors.red,),
          isThreeLine: true,
          onTap: (){
               displayToast(context, "Unable to fetch data for Johnson and Johnson");
          },
      ),
    ),
    Card(
          child: ListTile(
          leading: const Icon(Icons.vaccines_sharp),
          title: const Text('Novavax'),
          subtitle: const Text(
                'Type: Protein subunit vaccine \nFDA Aprroved: Yes \nCategory: Covid-19'
                  ),
          trailing: const Icon(Icons.check_circle, color: Colors.yellow,),
          isThreeLine: true,
          onTap: () {
              final Uri _url = Uri.parse('https://www.vaccines.gov/results/?zipcode=10007&medicationGuids=6537795d-19bc-45a3-8706-e3d5a81ba997&primaryGuids=6537795d-19bc-45a3-8706-e3d5a81ba997&medicationKeys=novavax_covid_19_vaccine');
              launchInBrowser(_url);
          },
      ),
    ),
    Card(
          child: ListTile(
          leading: const Icon(Icons.vaccines_sharp),
          title: const Text('JYNNEOS'),
          subtitle: const Text(
                'Type:  \nFDA Aprroved: Yes \nCategory: Monkey Pox'
                  ),
          trailing: const Icon(Icons.question_mark, color: Colors.grey,),
          isThreeLine: true,
          onTap: () {
              displayToast(context, "Unable to fetch data for JYNNEOS");
          },
      ),
    ),
    TextButton(
      onPressed: () => {launchInBrowser(Uri.parse('https://vaccinefinder.nyc.gov/'))}, 
      child: const Text(
      "Click Here for more vaccine information.", 
      textAlign: TextAlign.center, 
      style: TextStyle(
        color: Colors.blue, 
        decoration: TextDecoration.underline
        ),
      )
      ),
      const SizedBox(
        height: 230,
        child: Card(
          child: ListTile(
          leading: Icon(Icons.ad_units_outlined),
          title: Text('Ads'),
          subtitle: Text(
                'Popup here'
                  ),
      ),
    ),
      ),
  ]
)
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