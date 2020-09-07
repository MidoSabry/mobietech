import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCountry extends StatefulWidget {
  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  SavePref(String country) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("country", country);
    print(preferences.getString("country"));
  }

  //عشان متظهرش الصفحه دى غير مره واحده هى اول مره فقط
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var country = preferences.getString("country");
    if (country != null) {
      // Navigator.of(context).pushNamed('homepage');
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose your country"),
        ),
        body: Container(
            //padding: EdgeInsets.all(10),
            child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Egypt"),
              onTap: () {
                SavePref("egypt");
              },
              trailing: Image.asset(
                "images/flags/egy.png",
                width: 50,
                height: 50,
              ),
            ),
            ListTile(
              title: Text("Arab Saudi"),
              onTap: () {
                SavePref("saudi");
              },
              trailing: Image.asset(
                "images/flags/ksa.png",
                width: 50,
                height: 50,
              ),
            ),
            ListTile(
              title: Text("United Kingdom UK"),
              onTap: () {
                SavePref("uk");
              },
              trailing: Image.asset(
                "images/flags/uk.png",
                width: 50,
                height: 50,
              ),
            ),
            ListTile(
              title: Text("America"),
              onTap: () {
                SavePref("america");
              },
              trailing: Image.asset(
                "images/flags/usa.png",
                width: 50,
                height: 50,
              ),
            )
          ],
        )),
      ),
    );
  }
}
