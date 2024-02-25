import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/design/app_input.dart';

import '../../sheets/cities.dart';

class MyData extends StatelessWidget {
  const MyData({super.key});

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
              color: Theme.of(context).primaryColor.withOpacity(.14),
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
        title: Text("البيانات الشخصية"),
      ),
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 96.w,
                  height: 120.h,
                  child: Column(
                    children: [
                      Image.asset("assets/image/personn.png",
                          width: 75.w, height: 70.h),
                      Text("محمد علي",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          )),
                      Text(
                        "96654787856+",
                        style: TextStyle(
                            color: Color(0xffA2D273),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppInput(
            fillColor: Color(0xff8AC253).withOpacity(0.19),
              labelText: "اسم المستخدم",
              icon: "assets/icon/User.png",
              paddingBottom: 16.h),
          AppInput(
            fillColor: Color(0xff8AC253).withOpacity(0.19),
            labelText: "رقم الجوال",
            icon: "assets/icon/Phone.png",
            isPhone: true,
            paddingBottom: 16.h,
          ),
          AppInput(

              validator: (value) {
                if(value!.toString().isEmpty){
                  return "بارجاء ادخال رقم الجوال";
                }else if (value!.toString().length<9){
                  "يجب ان يكون رقم الهاتف مكون من 9 ارقام";
                }
                return null;

              },
              labelText: "رقم الجوال",
              icon: "assets/icon/Phone.png",
              isPhone: true),
          // StatefulBuilder(
          //   builder: (context, setState) => GestureDetector(
          //       onTap: () async {
          //         var result = await showModalBottomSheet(
          //             context: context,
          //             builder: (context) => const CitiesSheet());
          //         if (result != null) {
          //           bloc.selectedModel = result;
          //           setState(() {});
          //         }
          //       },
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Expanded(
          //             child: AbsorbPointer(
          //
          //               absorbing: true,
          //
          //               child: AppInput(
          //                   validator: (value) {
          //                     if(bloc.selectedModel==null){
          //                       return  "بارجاء اختيار المدينة";
          //                     }return null;
          //                   },
          //                   paddingBottom: 0,
          //                   isEnabled: true,
          //                   labelText: bloc.selectedModel?.name ?? "المدينه",
          //                   icon: "assets/icon/flag.png"),
          //             ),
          //
          //           ),
          //           if (bloc.selectedModel != null)
          //             IconButton(
          //               onPressed: () {
          //                 bloc.selectedModel = null;
          //                 setState(() {});
          //               },
          //               icon: const Icon(Icons.clear, color: Colors.red),
          //             )
          //         ],
          //       )),
          // ),
          AppInput(
            fillColor: Color(0xff8AC253).withOpacity(0.19),
            labelText: "كلمة المرور",
            icon: "assets/icon/Unlock.png",
            paddingBottom: 16.h,
          )
        ],
      ),
    );
  }
}
