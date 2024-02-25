import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/design/Select_item.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/design/map.dart';
import 'package:untitled3/features/addresses/events.dart';
import 'package:untitled3/features/addresses/states.dart';

import '../../../features/addresses/bloc.dart';


class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  // final String phone;
  // final String describe;




  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {

  final blocAddress = KiwiContainer().resolve<AddressBloc>();
   double lat=30;
   double lng=30;
  String type="العمل";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("إضافة عنوان"),
        ),
        body: ListView(
          children: [
            SizedBox(
                height: 400,
                child: GetMap(
                  onSelect: (val) {
                    lat=val.latitude;
                    lng=val.longitude;
                    print("${lat}");
                    print("${lng}");
                  },
                  lat: lat,
                  lng: lng,
                )),
            Form(
                key: blocAddress.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.r),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.only(right: 8.r, left: 8),
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.r),
                              border: Border.all(color: Color(0xffF3F3F3))),
                          child: Row(
                            children: [
                              Text(
                                "نوع العنوان",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0xff8B8B8B),
                                    fontWeight: FontWeight.w300),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  SelectableItem(
                                      "المنزل",type == "العمل", () {
                                    setState(() {
                                      type = "العمل";
                                    });
                                    ;
                                  }),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SelectableItem(
                                      "العمل", type == "المنزل", () {
                                    setState(() {
                                      type = "المنزل";
                                    });
                                  })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "بارجاء ادخال رقم الجوال";
                        } else if (value.toString().length < 9) {
                          return "يجب ان يكون رقم الهاتف مكون من 9 ارقام";
                        } else {
                          return null;
                        }
                      },
                      controller: blocAddress.phoneController,
                      decoration: InputDecoration(
                        label: Text("أدخل رقم الجوال"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "بارجاء ادخال الوصف";
                        } else {
                          return null;
                        }
                      },
                      controller: blocAddress.discriptionController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.r),
                            borderSide: BorderSide(color: Colors.white)),
                        label: Text("الوصف"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        text: "إضافة العنوان",
                        onPressed: () {
                          if (blocAddress.formKey.currentState!.validate()) {
                            blocAddress.add(AddAddressEvent(
                                phone: blocAddress.phoneController.text,
                                description:blocAddress.discriptionController.text,
                                type: type,
                                lat: lat,
                                lng: lng));
                          }
                        },
                      ),
                    )
                  ],
                ))
          ],
        )
        // BlocBuilder(
        //   bloc:blocAddress ,
        //   builder:(context, state) {
        //     if(state is AddAddressFailedState){
        //       return Text("Failed");
        //     }else if(state is AddAddressSuccessState){
        //       return  ;
        //     }else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //
        //   },
        // ),
        );
  }
}
