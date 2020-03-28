//import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/datamodels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;

//  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
//  Marker marker;

//  static final CameraPosition initialLocation = CameraPosition(
//    target: LatLng(13.6526, 100.4936),
//    zoom: 14.4746,
//  );

//  void updateMarker(UserLocation userLocation) {
//    this.setState(() {
//      marker = Marker(
//        markerId: MarkerId("home"),
//        position: LatLng(userLocation.lat, userLocation.long),
//        draggable: false,
//        zIndex: 2,
//        flat: true,
//        anchor: Offset(0.5, 0.5),
//      );
//    });
//  }

//  void getCurrentPosition() async {
//    try {
//      var location = await _locationTracker.getLocation();
//      updateMarker(UserLocation(location.latitude, location.longitude));
//
//      if (_locationSubscription != null) {
//        _locationSubscription.cancel();
//      }
//
//      _locationSubscription =
//          _locationTracker.onLocationChanged.listen((newLocalData) {
//        if (mapController != null) {
//          mapController.animateCamera(CameraUpdate.newCameraPosition(
//              new CameraPosition(
//                  bearing: 192.8334901395799,
//                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
//                  tilt: 0,
//                  zoom: 18.00)));
//          updateMarker(
//              UserLocation(newLocalData.latitude, newLocalData.longitude));
//        }
//      });
//    } on PlatformException catch (e) {
//      if (e.code == 'PERMISSION_DENIED') {
//        debugPrint("Permission Denied");
//      }
//    }
//  }

  @override
//  void dispose() {
//    if (_locationSubscription != null) {
//      _locationSubscription.cancel();
//    }
//    super.dispose();
//  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    var userLatLong = LatLng(userLocation.lat, userLocation.long);
//    setState(() {
//      cameraPos
//    });
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: userLatLong,
        zoom: 14.0,
      ),
      markers: Set.of([
        Marker(
          markerId: MarkerId("home"),
          position: userLatLong,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
        )
      ]),
      onTap: (argument) => {
        _goToNewPos()
      },
    );
  }

  Future<void> _goToNewPos() async {
    final GoogleMapController controller = await mapController;
    var location = await _locationTracker.getLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(location.latitude,location.longitude),
//        tilt: 59.440717697143555,
        tilt: 5,
        zoom: 14.151926040649414)));
  }
}
