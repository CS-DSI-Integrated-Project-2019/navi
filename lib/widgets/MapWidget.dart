//import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/datamodels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:mobile_app/services/google_polyline_service.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};

  Set<Polyline> get polyLines => _polyLines;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Completer<GoogleMapController> _controller = Completer();
  static LatLng latLng;
  GoogleMapPolyline _googleMapPolyline =
  GoogleMapPolyline(apiKey: "AIzaSyCQmxaKrBc0StNtLiBFp5VkYCSw55onV3k");
  Location currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    print('before location');
    getUserLocation();
    super.initState();
    print(latLng.toString());
  }

  getUserLocation() async {
    var location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    print('press1');
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      print('press2');
      _permissionGranted = await location.requestPermission();
      print("per "+_permissionGranted.toString());
      if (_permissionGranted != PermissionStatus.granted) {
        print('press3');
        return;
      }
      print('granted');
    }
    _locationData = await location.getLocation();
    print("check "+_locationData.toString());
    setState(() {
      print('in state');
      if(latLng.toString()!=null) {
        latLng = LatLng(_locationData.latitude, _locationData.longitude);
      }else{
        latLng = LatLng(13.6498302,100.49541);
      }
    });
    location.onLocationChanged.listen((currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      setState(() {
        if(latLng.toString()!=null) {
          latLng = LatLng(_locationData.latitude, _locationData.longitude);
        }
      });

      print("getLocation:$latLng");
      _onAddMarkerButtonPressed();
    });
  }

  void _onAddMarkerButtonPressed() {
    print('add marker 1');
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("111"),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return latLng.toString()!=null?Scaffold(
        appBar: AppBar(
          title: Text('Lat:${latLng.latitude}, Long: ${latLng.longitude}'),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: onCameraMove,
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 14.0,
          ),
          markers: _markers,
          polylines: polyLines,
          onTap: (argument) => {_goToNewPos()},

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            print('pressed');
            _goToNewPos();
            sendRequest();
          },
          label: Text('Direction'),
          icon: Icon(Icons.directions_walk),
        )
    ):Text('please allow location');
  }

  Future<void> _goToNewPos() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latLng.latitude, latLng.longitude),
//        tilt: 59.440717697143555,
        tilt: 5,
        zoom: 14.151926040649414)));
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  void createRoute(String encondedPoly) {
    _polyLines.clear();
    _polyLines.add(Polyline(
        polylineId: PolylineId(latLng.toString()),
        width: 4,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.blue));
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  void sendRequest() async {
    LatLng destination = LatLng(13.6526,100.4936);
    String route =
    await _googleMapsServices.getRouteCoordinates(latLng, destination);
    createRoute(route);
    _addMarker(destination, "LX building");
  }
  void _addMarker(LatLng location, String address) {
    print('add markder');
    _markers.add(Marker(
        markerId: MarkerId("112"),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: BitmapDescriptor.defaultMarker));
  }
}
