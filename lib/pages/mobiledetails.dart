import 'package:flutter/material.dart';

class MobileDetails extends StatefulWidget {
  final name_d;
  final front_camera_d;
  final back_camera_d;
  final ram_d;
  final storage_d;
  final os_d;
  final battery_d;
  final price_eg_d;
  final price_ksa_d;
  final price_uk_d;
  final price_us_d;
  // final image_d;

  MobileDetails({
    this.name_d,
    this.front_camera_d,
    this.back_camera_d,
    this.ram_d,
    this.storage_d,
    this.os_d,
    this.battery_d,
    this.price_eg_d,
    this.price_ksa_d,
    this.price_uk_d,
    this.price_us_d,
    //this.image_d
  });

  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {
  @override
  Widget build(BuildContext context) {
    return
        //textDirection: TextDirection.rtl,
        Scaffold(
            appBar: AppBar(
              title: Text('Details'),
              centerTitle: true,
            ),
            body: ListView(children: <Widget>[
              Column(children: <Widget>[
                Container(
                  height: 300,
                  width: 500,
                  child: Image.asset("images/product/6pro.jpg"),
                ),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.name_d,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("Front Camera:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.front_camera_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("Back Camera:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.back_camera_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("RAM:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.ram_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("Storage:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.storage_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("OS:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.os_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("Battery:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.battery_d,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          child: Text("Price:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                      SizedBox(width: 20),
                      Container(
                          child: Text(widget.price_eg_d,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )))
                    ]),
                  ),
                ),
              ])
            ]));
  }
}
