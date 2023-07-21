import 'package:covid_tracker/network/api_data_model.dart';
import 'package:covid_tracker/views/home/screen/partials/map_partials.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screen/fragments/maps/map_screen.dart';
import '../screen/partials/navigation_drawer.dart';


class MapScreenState extends State<MapScreen>{

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.71278, -74.00594),
    zoom: 11.5
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maps")),
      drawer:navigationDrawer(context),
      body:  GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.satellite,
        markers: {
          mapMarker(context, "_manhattan", "Manhattan", BitmapDescriptor.defaultMarker, 40.71278, -74.00594, LiveBoroughData.manhattanLiveData), // Manhattan
          mapMarker(context, "_brooklyn", "Brooklyn", BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), 40.6782, -73.9442, LiveBoroughData.brooklynLiveData), //Brooklyn
          mapMarker(context, "_queens", "Queens", BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen), 40.7282, -73.7949, LiveBoroughData.queensLiveData), // Queens
          mapMarker(context, "_bronx", "Bronx", BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta), 40.8448, -73.8648, LiveBoroughData.bronxLiveData), // Bronx
          mapMarker(context, "_statenIsland", "Staten Island", BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), 40.5795, -74.1502, LiveBoroughData.statenIslandLiveData), // Staten Island
        },
      ),
    );
  }
}