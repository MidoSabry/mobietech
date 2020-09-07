import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    email = preferences.getString("email");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: isSignIn ? Text(email) : Text(""),
            accountName: isSignIn ? Text(username) : Text(""),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage("images/drawer.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: Text(
              "Home page",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.blue,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('homepage');
            },
          ),
          ListTile(
            title: Text(
              "Categories",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.category,
              color: Colors.blue,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('categories');
            },
          ),
          isSignIn
              ? ListTile(
                  title: Text(
                    "Add Posts",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  leading: Icon(
                    Icons.local_post_office,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("post");
                  },
                )
              : SizedBox(height: 0),
          Divider(
            color: Colors.blue,
          ),
          ListTile(
            title: Text(
              "About",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.info,
              color: Colors.blue,
              size: 30,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
              size: 30,
            ),
            onTap: () {},
          ),
          isSignIn
              ? ListTile(
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.remove("username");
                    preferences.remove("email");
                    Navigator.of(context).pushNamed("login");
                  },
                )
              : ListTile(
                  title: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("login");
                  },
                ),
        ],
      ),
    );
  }
}
