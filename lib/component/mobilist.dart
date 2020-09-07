import 'package:flutter/material.dart';
import 'package:mobietech/pages/mobiledetails.dart';

class MobiList extends StatelessWidget {
  var price;

  final country;
  final name;
  final front_camera;
  final back_camera;
  final ram;
  final storage;
  final os;
  final battery;
  final price_eg;
  final price_ksa;
  final price_uk;
  final price_us;
  //final image;
  MobiList({
    this.name,
    this.front_camera,
    this.back_camera,
    this.ram,
    this.storage,
    this.os,
    this.battery,
    this.price_eg,
    this.price_ksa,
    this.price_uk,
    this.price_us,
    this.country,
    // this.image
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          child: Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset("images/product/6pro.jpg"),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 30),
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),

                        /*
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Text(
                                        "Camera :32mp",
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                      Text("Ram:8m",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ))
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "price: 8000\$",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18),
                                    ),
                                  )
                                  */
                      ])),
            ),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MobileDetails(
            name_d: name,
            front_camera_d: front_camera,
            back_camera_d: back_camera,
            ram_d: ram,
            storage_d: storage,
            os_d: os,
            battery_d: battery,
            price_eg_d: price_eg,
            price_ksa_d: price_ksa,
            price_uk_d: price_uk,
            price_us_d: price_us,
            //image_d: image,
          );
        }));
      },
    );
  }
}
