import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../logic/help_navigator.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {

  @override
  void initState() {
    super.initState();
    determinePosition().then((value) => setState((){}));

  }
  String? myAddress;

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Image.asset(
              "assets/image/logo.png",
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: "التوصيل إلى",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor),
                    children:  [
                      TextSpan(text: "\n"),
                      if(myAddress!=null)
                        TextSpan(
                          text: "${myAddress}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ]),
              ),
            ),
            Badge(
              alignment: AlignmentDirectional.topStart,
              label: const Text(
                "3",
                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                width: 33,
                height: 33,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadius.circular(9)),
                child: SvgPicture.asset(
                  "assets/icon/svg/cart.svg",
                ),
              ),
            )
          ],
        ),
      ),
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
      showMessage("Location permissions are permanently denied, we cannot request permissions.",type: MessageType.waring);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var myPosition= await Geolocator.getCurrentPosition();
    getNameLocation(lat: myPosition.latitude,lng: myPosition.longitude);
    print(myPosition);
    return myPosition;
  }
  Future<void>getNameLocation({required double lat,required double lng}) async{
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat,lng);
    var name =placeMarks.first;
    print(name.locality);
    myAddress="${name.locality}";
    //placeMarks[0].locality.toString();
    print("******************************8");
    print(myAddress);

  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}