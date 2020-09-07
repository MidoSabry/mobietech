import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Row(children: <Widget>[
          Text("Loding...."),
          CircularProgressIndicator(),
        ]));
      });
}

showdialogall(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: <Widget>[
            FlatButton(
              child: Text("done"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

class _LoginState extends State<Login> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // bool isLoading = false;
//start form controller
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  TextEditingController id = new TextEditingController();

  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  SavePref(String username, String email, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    print(preferences.getString("id"));
  }

  String validglobal(String val) {
    if (val.isEmpty) {
      return "cant be empty";
    }
  }

  String validusername(String val) {
    if (val.trim().isEmpty) {
      return "Enter username";
    }
    if (val.trim().length < 4) {
      return "username canot be less than 4 character";
    }
    if (val.trim().length > 20) {
      return "username canot be more than 20 character";
    }
  }

  String validemail(String val) {
    if (val.trim().isEmpty) {
      return "Enter email";
    }
    if (val.trim().length < 4) {
      return "email canot be less than 4 character";
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "email not valid for example ms259915@gmail.com";
    }
  }

  String validpassword(String val) {
    if (val.trim().isEmpty) {
      return "Enter password";
    }
    if (val.trim().length < 4) {
      return "password canot be less than 4 character";
    }
    if (val.trim().length > 20) {
      return "password canot be more than 20 character";
    }
  }

  String validconfirmpassword(String val) {
    if (val != password.text) {
      return "passwords are not compitatble";
    }
  }

  signin() async {
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();
      /*
      setState(() {
        isLoading = true;
      });
      */
      showloading(context);
      var data = {"email": email.text, "password": password.text};
      var url = "http://10.0.2.2:8080/mobietech/login.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      // print(response.body.toString());

      if (responsebody['status'] == "success") {
        SavePref(responsebody['username'], responsebody['email'],
            responsebody['id']);
        //print(responsebody['username']);
        Navigator.of(context).pushNamed("homepage");
      } else {
        print("Login faild");
        showdialogall(context, "Wrong", "Email or password is wrong");
        /*
        setState(() {
          isLoading = false;
        });
        */
        /*
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        */
      }
    } else {
      print("not valid");
    }
  }

  signup() async {
    var formdata = formstatesignup.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {
        "email": email.text,
        "password": password.text,
        "username": username.text
      };
      var url = "http://10.0.2.2:8080/mobietech/signup.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      //print(response.body.toString());

      if (responsebody['status'] == "success") {
        SavePref(username.text, email.text, id.text);
        //print(responsebody['username']);
        print("yes success");
        Navigator.of(context).pushNamed("homepage");
      } else {
        print(responsebody['status']);
        Navigator.of(context).pop();
        showdialogall(context, "Wrong", "the email is already exist");
      }
    } else {
      print("not valid");
    }
  }

  //to change pages between signin and signup
  TapGestureRecognizer _changesign;
  bool showsignin = true;

  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
        });
      };
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var mdh = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            buildPositionedTop(mdw),
            buildPositionedBottom(mdw),
            Container(
              height: 1000,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(showsignin ? "Sign In" : "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  buildContainerAvatar(mdw),
                  showsignin
                      ? buildFormBoxSignin(mdw)
                      : buildFormBoxSignup(mdw),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(children: <Widget>[
                      showsignin
                          ? InkWell(
                              onTap: () {},
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(height: showsignin ? 20 : 0),
                      RaisedButton(
                        color: showsignin ? Colors.blue : Colors.grey[700],
                        elevation: 10,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        onPressed: showsignin ? signin : signup,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                showsignin ? "Sign in" : "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ]),
                      ),
                      /*
                      isLoading
                          ? CircularProgressIndicator()
                          : Padding(
                              padding: EdgeInsets.all(0),
                            ),
                            */
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: _changesign,
                                    text: showsignin
                                        ? "Create new account"
                                        : "Register",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline))
                              ]),
                        ),
                      ),
                      SizedBox(height: 10),
                      showsignin
                          ? Row(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Expanded(
                                child: RaisedButton(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.red[400],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      //Image.asset(
                                      //'images/icon/g.jpg',
                                      //width: 25,
                                      //height: 25,
                                      //),
                                      Text(
                                        "Sign In Google",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Expanded(
                                child: RaisedButton(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.blue[800],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Image.asset(
                                      //'images/icon/f.png',
                                      // width: 25,
                                      // height: 25,
                                      //),
                                      Text(
                                        "Sign In Facebook",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                            ])
                          : Text(""),
                    ]),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center buildFormBoxSignin(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        margin: EdgeInsets.only(top: 20),
        height: 250,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
          //autovalidate: true,
          key: formstatesignin,
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //start text user name
                  Text(
                    "Email:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll(
                      "Enter Email.....", false, email, validemail),
                  SizedBox(height: 10),
                  //end text user name
                  //start text password
                  Text(
                    "Password:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll(
                      "Enter Password.....", true, password, validpassword),
                  //end text user name
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center buildFormBoxSignup(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 7),
        height: 360,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
          // autovalidate: true,
          key: formstatesignup,
          child: Container(
            margin: EdgeInsets.only(top: showsignin ? 30 : 5),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //start text user name
                  Text(
                    "User name:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll(
                      "Enter UserName.......", false, username, validusername),
                  SizedBox(height: 10),
                  Text(
                    "Email:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll(
                      "Enter Email.....", false, email, validemail),
                  SizedBox(height: 10),
                  //end text user name
                  //start text password
                  Text(
                    "Password:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll(
                      "Enter Password.....", true, password, validpassword),
                  SizedBox(height: 10),
                  Text(
                    "Confirm Password:",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  buildTextFormFieldFieldAll("Enter Password.....", true,
                      confirmpassword, validconfirmpassword),
                  //end text user name
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldFieldAll(String myhinttext, bool pass,
      TextEditingController myController, myvalid) {
    return TextFormField(
      // autovalidate: true,
      controller: myController,
      obscureText: pass,
      validator: myvalid,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[500], style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: showsignin ? Colors.yellow : Colors.grey[600],
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
            ]),
        child: InkWell(
          onTap: () {
            setState(() {
              showsignin = !showsignin;
            });
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 25,
                right: 25,
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 35,
                left: 60,
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }

  Positioned buildPositionedTop(double mdw) {
    return Positioned(
      child: Transform.scale(
        scale: 1.3,
        child: Transform.translate(
          offset: Offset(0, -mdw / 1.7),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: mdw,
              width: mdw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: showsignin ? Colors.grey[800] : Colors.blue,
              )),
        ),
      ),
    );
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
      top: 200,
      right: mdw / 1.5,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mdw),
            color: showsignin
                ? Colors.blue[800].withOpacity(0.5)
                : Colors.grey[800].withOpacity(0.3),
          )),
    );
  }
}
