import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'comment.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  var id = "";
  var username = "none";
  var email;

  /*
  List posts = [
    {
      'name': "mohamed sabry",
      'content':
          "hellow everybody my name is mohamed and i have samsung glaxy s10 and......."
    },
    {
      'name': "mohamed259",
      'content':
          "hellow everybody my name is mohamed and i have samsung glaxy s11 and......."
    }
  ];
  */

  TextEditingController _addpost = new TextEditingController();

  Future getPost() async {
    var url = "http://10.0.2.2:8080/mobietech/post.php";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  Future addpost() async {
    var url = "http://10.0.2.2:8080/mobietech/addpost.php";
    var data = {"post": _addpost.text, "postuser": id};
    var response = await http.post(url, body: data);
    Navigator.of(context).pushNamed("post");
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id");
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
  }

  @override
  void initState() {
    getPost();
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Posts"),
            ),
            body: ListView(children: <Widget>[
              Card(
                  child: Column(children: <Widget>[
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: TextFormField(
                    controller: _addpost,
                    maxLength: 255,
                    maxLines: 10,
                    minLines: 1,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Add your post",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: InkWell(
                          onTap: addpost,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.2)))),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add_box, color: Colors.grey),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                  ),
                                  Text(
                                    "Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ],
                              ))))
                ])
              ])),
              FutureBuilder(
                future: getPost(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        for (int i = snapshot.data.length - 1; i >= 0; i--)
                          PostList(
                              name: snapshot.data[i]['username'],
                              contentpost: snapshot.data[i]['post'],
                              postid: snapshot.data[i]['post_id'])
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              )
              /*
              PostList(
                name: "Mido sabry",
                contentpost:
                    "mnsdkjj,m,nbiyehknmnskskdjm,n,bjhkajsjnmsambmNmkakjdnNDahsdk",
              ),
              */
            ])));
  }
}

class PostList extends StatelessWidget {
  final postid;
  final name;
  final contentpost;
  PostList({this.name, this.contentpost, this.postid});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(name),
          ),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
          subtitle: Text(
            contentpost,
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                child: Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.thumb_up, color: Colors.grey),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Like",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.comment, color: Colors.grey),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Comment",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Comments(
                      postid: postid,
                    );
                  }));
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
        )
      ]),
    );
  }
}
