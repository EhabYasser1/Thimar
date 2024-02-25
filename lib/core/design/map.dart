
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

class GetMap extends StatefulWidget {
late   double lat;
late   double lng;
 final bool lightMode;
 final ValueChanged<LatLng> onSelect;
    GetMap({super.key, required this.onSelect,required this.lat, required this.lng,  this.lightMode=false});

  @override
  State<GetMap> createState() => _GetMapState();
}
Set<Marker> markers={
  // const Marker(
  //   markerId: MarkerId("1"),
  //   position: LatLng(31.0181913, 31.3884559),
  // ),

};
final  _controller = Completer<GoogleMapController>();

class _GetMapState extends State<GetMap> {



  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      onMapCreated: (controller) {
        _controller.complete(controller);
      },

      markers: markers,
      onTap: (argument) {
        goToMyLocation(location: argument);

        markers.add( Marker(
          markerId: const MarkerId("1"),
          position: LatLng(argument.latitude,argument.longitude),
        ));
        setState(() {

        });

      },
      initialCameraPosition:
      const CameraPosition(zoom: 14,target: LatLng(31.0181913, 31.3884559)),

    );
  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      showMessage("Location services are disabled",type: MessageType.waring);
      return Future.error('Location services are disabled.');

    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showMessage("Location permissions are denied",type: MessageType.waring);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      showMessage("Location permissions are permanently denied, we cannot request permissions.",type: MessageType.waring);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


   var myPosition= await Geolocator.getCurrentPosition();
    goToMyLocation(location:  LatLng(myPosition.latitude, myPosition.longitude));
    getNameLocation(lat: myPosition.latitude,lng: myPosition.longitude);
    return myPosition;
  }
  Future<void>getNameLocation({required double lat,required double lng}) async{
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat,lng);
    placeMarks[0].locality.toString();
  }
  Future<void> goToMyLocation({required LatLng location}) async {
    widget.lat = location.latitude;
    widget.lng = location.longitude;

    final GoogleMapController controller = await _controller.future;
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(location.latitude, location.longitude)));
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 14, target: location)));
    widget.onSelect(location);
    setState(() {});
  }
}


