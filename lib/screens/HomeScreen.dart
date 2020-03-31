import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_app/screens/ARScreen.dart';
import 'package:mobile_app/screens/MapScreen.dart';
import 'package:mobile_app/screens/CallScreen.dart';

import 'package:mobile_app/screens/mock/ContactScreen.dart';
import 'package:mobile_app/screens/mock/FriendScreen.dart';
import 'package:mobile_app/screens/mock/DetailScreen.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proof of Concepts'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('AR'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ARScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200.0,
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Map'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200.0,
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Call'),
                onPressed: () async {
                  await PermissionHandler().requestPermissions(
                    [PermissionGroup.camera, PermissionGroup.microphone],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallScreen(channelName: 'LX')),
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
                    MaterialPageRoute(builder: (context) => ContactScreen()),
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
                    MaterialPageRoute(builder: (context) => FriendScreen()),
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
                    MaterialPageRoute(builder: (context) => DetailScreen()),
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
