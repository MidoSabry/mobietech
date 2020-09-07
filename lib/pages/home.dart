import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//import 'package:mobietec/component/mobilist.dart';
//import 'package:mobietec/component/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'package:mobietech/component/mobilist.dart';
import 'package:mobietech/component/mydrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var listsearch = [];
  var country;
//for search
  Future getData() async {
    var url = "http://10.0.2.2:8080/mobietech/search.php";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]['name']);
    }
    print(listsearch);
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    country = preferences.getString("country");
    print(country);
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobieTech"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 6,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: DataSearch(list: listsearch));
              }),
        ],
        // brightness: Brightness.light,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250.0,
            width: double.infinity,
            child: Carousel(
              images: [
                AssetImage(
                  'images/slider/slider1.jpg',
                ),
                AssetImage(
                  'images/slider/slider2.jpg',
                ),
                AssetImage(
                  'images/slider/slider3.jpg',
                ),
              ],
              dotSize: 8,
              dotIncreaseSize: 2,
              dotIncreasedColor: Colors.blue,
              dotSpacing: 20,
              // dotColor: Colors.blue,
              dotBgColor: Colors.black.withOpacity(0.5),
              showIndicator: true,
              indicatorBgPadding: 18,
              boxFit: BoxFit.cover,
              //overlayShadow: true,
              //overlayShadowColors: Colors.blue,
              //overlayShadowSize: 0.2,
            ),
          ),
          //end carousel
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 28, color: Colors.blue),
            ),
          ),
          //start category
          Container(
            height: 120,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/apple.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Apple", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/honor.jpeg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Honor", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/htc.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("HTC", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/huawei.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Huawei", textAlign: TextAlign.center),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 200,
                  width: 125,
                  child: ListTile(
                    title: Image.asset(
                      'images/brand/samsung.jpeg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                    subtitle: Container(
                      child: Text("Samsung", textAlign: TextAlign.center),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("samsung");
                },
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/infinix.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Infinix", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/nokia.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Nokia", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/oppo.jpeg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("OPPO", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/xiaomi.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("Xiaomi", textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 125,
                child: ListTile(
                  title: Image.asset(
                    'images/brand/realme.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  subtitle: Container(
                    child: Text("realme", textAlign: TextAlign.center),
                  ),
                ),
              ),
            ]),
          ),
          //end categories

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Newest",
              style: TextStyle(fontSize: 28, color: Colors.blue),
            ),
          ),
          //start grid view as latest products
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 400,
              width: 300,
              child: GridView.count(
                //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //  crossAxisCount: 3),
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: <Widget>[
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/s10.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Samsung S10",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/6pro.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Realme 6pro",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/note9.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Xiaomi note9",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/a92.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Oppo A92",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/9pro.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Oppo 9pro",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset("images/product/s10.jpg"),
                      footer: Container(
                        height: 50,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Samsung S10",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});

  Future getsearchdata() async {
    var url = "http://10.0.2.2:8080/mobietech/searchmob.php";
    var data = {"searchmobile": query};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Action for AppBar
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icon leading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //result search
    return FutureBuilder(
        future: getsearchdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return MobiList(
                    name: snapshot.data[i]['name'],
                    front_camera: snapshot.data[i]['front_camera'],
                    back_camera: snapshot.data[i]['back_camera'],
                    // image: snapshot.data[i]['image'],
                    ram: snapshot.data[i]['ram'],
                    storage: snapshot.data[i]['storage'],
                    os: snapshot.data[i]['os'],
                    battery: snapshot.data[i]['battery'],
                    price_eg: snapshot.data[i]['price_eg'],
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone search for something

    var searchlist =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text(searchlist[i]),
            onTap: () {
              query = searchlist[i];
              showResults(context);
            },
          );
        });
  }
}
