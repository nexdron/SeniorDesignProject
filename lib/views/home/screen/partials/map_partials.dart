import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker mapMarker(
                BuildContext context,
                String _markerId, 
                String _markerTitle,
                BitmapDescriptor _bitmapDescriptor,
                double lat,
                double long,
                Map _liveDataMap
                )
{
  return Marker(
    markerId: MarkerId(_markerId),
    infoWindow: InfoWindow(title: _markerTitle),
    icon: _bitmapDescriptor,
    position: LatLng(lat, long),
    onTap: () => {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(_markerTitle),
          content: Text(' CONFIRMED_CASE_RATE : ${_liveDataMap['CONFIRMED_CASE_RATE']} \n CASE_RATE: ${_liveDataMap['CASE_RATE']} \n HOSPITALIZED_RATE: ${_liveDataMap['HOSPITALIZED_RATE']} \n DEATH_RATE: ${_liveDataMap['DEATH_RATE']} \n CONFIRMED_CASE_COUNT: ${_liveDataMap['CONFIRMED_CASE_COUNT']} \n PROBABLE_CASE_COUNT: ${_liveDataMap['PROBABLE_CASE_COUNT']} \n CASE_COUNT: ${_liveDataMap['CASE_COUNT']} \n HOSPITALIZED_COUNT: ${_liveDataMap['HOSPITALIZED_COUNT']} \n DEATH_COUNT: ${_liveDataMap['DEATH_COUNT']} \n Data as of latest ${_liveDataMap['time']}'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    },
  );
}