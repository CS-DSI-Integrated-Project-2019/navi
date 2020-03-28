import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/contact.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // title: new Text("csd"),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            // leading: GestureDetector(
            //   onTap: () {
            //     print("test");
            //   },
            //   child: Icon(
            //     Icons.arrow_downward,
            //     color: Colors.white, // add custom icons also
            //   ),
            // ),
          ),
          drawer: Drawer(
            
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.only(left: 100.0),
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.indigo[400],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lounge Area",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                color: Colors.indigo[600],
                                child: Icon(Icons.phone, color: Colors.white),
                                margin: EdgeInsets.only(right: 20.0)),
                            Container(
                              color: Colors.indigo[600],
                              child:
                                  Icon(Icons.chat_bubble, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.white,
                  size: 60.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
