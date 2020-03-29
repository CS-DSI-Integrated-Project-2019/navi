import 'package:flutter/material.dart';
import './map.dart';
import './contact.dart';
import './friend.dart';
import './detail.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prototype'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                child: Text('Map'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Map()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                child: Text('Contact'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contact()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                child: Text('Friend Search'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Friend()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                child: Text('Detail'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
