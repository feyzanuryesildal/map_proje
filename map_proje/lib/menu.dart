import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return MapScreen();
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.7750, 29.9480),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  bool _mapCreated = false;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: _onMapCreated),
          if (!_mapCreated) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _mapCreated = true;
    });
    // get current position here and use mapController when it is completed
  }
}
