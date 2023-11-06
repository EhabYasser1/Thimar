import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetAddressView extends StatefulWidget {
  const GetAddressView({super.key});

  @override
  State<GetAddressView> createState() => _GetAddressViewState();
}
 Set<Marker> markers={
  Marker(
      markerId: MarkerId("1"),
    position: LatLng(31.0181913, 31.3884559),
  ),

 };
class _GetAddressViewState extends State<GetAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إضافة عنوان"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(

              markers: markers,
              onTap: (argument) {

                markers.add( Marker(
                  markerId: MarkerId("1"),
                  position: LatLng(argument.latitude,argument.longitude),
                ));
                setState(() {

                });
              },
              initialCameraPosition:
                  CameraPosition(zoom: 14,target: LatLng(31.0181913, 31.3884559)),

            ),
          )
        ],
      ),
    );
  }
}
