import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobietech/component/mobilist.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Samsung extends StatefulWidget {
  @override
  _SamsungState createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {
  /*
  var mobilelist = [
    {
      'image': 'images/product/sa71.jpg',
      'name': 'Samsung A71',
      'Front Camera': '32MP',
      'Back Camera': '512MP',
      'RAM': '8GB',
      'Storage': '128GB',
      'OS': 'Android 10',
      'Battery': '4500',
      'Price': '8000'
    },
    {
      'image': 'images/product/note9.jpg',
      'name': 'Samsung Note9',
      'Front Camera': '32MP',
      'Back Camera': '512MP',
      'RAM': '16GB',
      'Storage': '64GB',
      'OS': 'Android 10',
      'Battery': '6500',
      'Price': '10000'
    },
  ];
  */
  var country_pref;

  Future getData() async {
    var url = "http://10.0.2.2:8080/mobietech/index.php";
    var data = {"cat": "1"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  //عشان متظهرش الصفحه دى غير مره واحده هى اول مره فقط
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      country_pref = preferences.getString("country");
    });
  }

  @override
  void initState() {
    getPref();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Samsung'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return MobiList(
                      country: country_pref,
                      name: snapshot.data[i]['name'],
                      front_camera: snapshot.data[i]['front_camera'],
                      back_camera: snapshot.data[i]['back_camera'],
                      // image: snapshot.data[i]['image'],
                      ram: snapshot.data[i]['ram'],
                      storage: snapshot.data[i]['storage'],
                      os: snapshot.data[i]['os'],
                      battery: snapshot.data[i]['battery'],
                      price_eg: snapshot.data[i]['price_eg'],
                      price_ksa: snapshot.data[i]['price_ksa'],
                      price_uk: snapshot.data[i]['price_uk'],
                      price_us: snapshot.data[i]['price_us'],
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
