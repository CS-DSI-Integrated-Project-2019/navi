import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/GoogleMap.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return GMap();
  }
}