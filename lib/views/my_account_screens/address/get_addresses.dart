import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/design/HomeAppBar.dart';
import 'package:untitled3/core/design/appBar.dart';
import 'package:untitled3/features/addresses/events.dart';
import 'package:untitled3/features/addresses/states.dart';

import '../../../features/addresses/bloc.dart';
import '../../../features/addresses/model.dart';



class GetAddresses extends StatefulWidget {
  const GetAddresses({super.key});

  @override
  State<GetAddresses> createState() => _GetAddressesState();
}

class _GetAddressesState extends State<GetAddresses> {
  final blocGetAddresses = KiwiContainer().resolve<AddressBloc>()
    ..add(GetAddressEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(text: "العناوين"),
        body: BlocBuilder(
          bloc: blocGetAddresses,
          builder: (context, state) {
            if (state is GetAddressFailedState) {
              return Text("filed");
            } else if (state is GetAddressSuccessState) {
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      Items(model: state.list[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 1.h),
                  itemCount: state.list.length);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class Items extends StatefulWidget {
  final AddressModel model;

   Items({super.key, required this.model});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  void initState() {
    super.initState();
    getNameLocation(lat: widget.model.lat, lng: widget.model.lng);
  }
  String? myAddress;

  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15.r),
      child: Container(
        padding: EdgeInsets.only(left: 13.w,right: 16.w,top: 4.h),
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color:Theme.of(context).primaryColor)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.model.type}",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                myAddress!=null?
                  Text(" العنوان: ${myAddress}  ",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.w300)): Text(" العنوان: بارجاء ادخال العنوان في المحاوله القادمه ",
                    style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.w300)),
                Text(" الوصف :${widget.model.description}",
                    style: TextStyle(color: Theme.of(context).hintColor,fontSize:11.sp,fontWeight: FontWeight.w300)),
                Text(" رقم الجوال : ${widget.model.phone}",
                    style: TextStyle(color: Theme.of(context).hintColor,fontSize:11.sp,fontWeight: FontWeight.w300 ))
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: Color(0xffFF0000).withOpacity(.11)),
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Image.asset("assets/icon/trash.png"),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: Color(0xff4C8613).withOpacity(.13)),
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Image.asset("assets/icon/trash.png"),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void>getNameLocation({required double lat,required double lng}) async{
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat,lng);
    var name =placeMarks.first;
    print(name.locality);
    myAddress="${name.name}";
    //placeMarks[0].locality.toString();
    print("******************************8");
    print(myAddress);

  }
}
