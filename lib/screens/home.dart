import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home.jpg"),
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
            leading: GestureDetector(
              onTap: () {
                print("test");
              },
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white, // add custom icons also
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                height: 75.0,
                color: Color.fromRGBO(0, 0, 0, .2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _infoColumn(22, "minutes away", CrossAxisAlignment.start),
                    _infoColumn(
                        123, "metres remaining", CrossAxisAlignment.center),
                    _infoColumn(
                        5, "steps completed", CrossAxisAlignment.end, 8),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                height: 150.0,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "WALK TO",
                            style: TextStyle(
                              color: Color.fromRGBO(
                                0,
                                0,
                                0,
                                .5,
                              ),
                              fontSize: (16),
                            ),
                          ),
                          Text(
                            "Security Checkpoint 3",
                            style: TextStyle(
                                fontSize: (18), fontWeight: (FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:5.0),
                            padding: EdgeInsets.only(
                                left: 5.0, top: 2.5, right: 5.0, bottom: 2.5),
                            child: Text(
                              "12 MIN WAIT",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _infoColumn(
      int number, String description, CrossAxisAlignment alignment,
      [int maxNumber]) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: alignment,
      children: <Widget>[
        Text(
          (maxNumber != null ? "$number of $maxNumber" : number.toString()),
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
