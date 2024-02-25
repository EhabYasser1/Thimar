
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/features/contact/bloc.dart';
import 'package:untitled3/features/contact/events.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
final contactBloc = KiwiContainer().resolve<ContactBloc>()..add(GetContactEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(.14),
            ),
            child: IconButton(
              padding: EdgeInsetsDirectional.only(
                bottom: 2.h,
              ),
              icon: Image.asset("assets/icon/arrowR.png"),
              onPressed: () {},
            ),
          ),
        ),
        title: Text("تواصل معنا"),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200.h,
                child: GoogleMap(
                  liteModeEnabled: true,
                    initialCameraPosition: CameraPosition(target: LatLng(31.0181913, 31.3884559))),
              ),
              // Container(
              //   height: 120.h,
              //   color: Colors.red,
              // )
            ],
          )
        ],
      ),
    );
  }
}
