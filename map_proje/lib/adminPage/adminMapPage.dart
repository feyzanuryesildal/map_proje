import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_proje/service/status_service.dart';

class adminMapPage extends StatefulWidget {
  const adminMapPage({Key? key}) : super(key: key);

  @override
  _adminMapPageState createState() => _adminMapPageState();
}

class _adminMapPageState extends State<adminMapPage> {
  StatusService _statusService = StatusService();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.778690, 29.909470),
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
      appBar: AppBar(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: _onMapCreated,
            markers: _markers,
          ),
          if (!_mapCreated) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

  Set<Marker> _markers = {};
  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _mapCreated = true;
      _markers.add(Marker(
          markerId: MarkerId("id-1"),
          position: const LatLng(40.7562, 29.8309)));
      var duraklar = _statusService.getdurakStatus();
    });
  }

  void builder() {
    StreamBuilder(
        stream: _statusService.getdurakStatus(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return !snapshot.hasData
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data!.docs[index];
                    return Text("");
                  },
                );
        });
    // get current position here and use mapController when it is completed
  }
}
