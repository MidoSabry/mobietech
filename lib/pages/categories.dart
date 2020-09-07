import 'package:flutter/material.dart';
import 'package:mobietech/component/mydrawer.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/samsung.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Samsung",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {
                  Navigator.of(context).pushNamed("samsung");
                },
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/apple.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Apple",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/htc.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("HTC",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/huawei.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Huawei",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/infinix.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Infinix",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/oppo.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Oppo",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/realme.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Realme",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/nokia.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Nokia",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/xiaomi.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Xiaomi",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              ),
              InkWell(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        "images/brand/honor.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: Text("Honor",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )),
                onTap: () {},
              )
            ],
          ),
        ));
  }
}
