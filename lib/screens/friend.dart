import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Friend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              "CIRCLE",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            DotsIndicator(
              dotsCount: 3,
              position: 1,
              decorator: DotsDecorator(
                color: Colors.grey[400],
                activeColor: Colors.black,
              ),
            ),
          ],
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 4.0,
        leading: new Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/kmutt_map.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      left: 150.0,
                      top: 100.0,
                      child: Icon(
                        Icons.person_pin,
                        size: 70.0,
                        color: Colors.pink,
                      ),
                    ),
                    Positioned(
                      left: 200,
                      top: 30.0,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 10.0, right: 10.0, bottom: 30.0),
                        color: Colors.brown,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("2nd Floor",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("Room: CB2308",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.black,
                  child: ListView(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    children: <Widget>[
                      _friendInfo("Rob", "Near LX Building", 0.5),
                      _friendInfo("Johnathan", "1st floor, LX Building", 1.2,
                          Colors.pink),
                      _friendInfo("Carl", "2nd floor, LX Building ", 1.4),
                      _friendInfo("Molly", "1st floor, LX Building ", 1.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Padding _friendInfo(String name, String location, double distance,
      [Color iconColor]) {
    return (Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Material(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          width: double.infinity,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.account_circle,
                      size: 40.0,
                      color: (iconColor != null ? iconColor : Colors.black)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "$distance miles",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
