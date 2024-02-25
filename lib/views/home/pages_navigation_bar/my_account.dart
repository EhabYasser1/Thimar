

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

import '../../my_account_screens/terms.dart';
import '../../my_account_screens/wallet.dart';

class MyAccPage extends StatelessWidget {
  const MyAccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 220.h,
                width: double.infinity,
                child: Image.asset("assets/icon/Mask.png",fit: BoxFit.fill,),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40.r) ,bottomRight: Radius.circular(40.r))
                ),
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h,),
                    Text("حسابي",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white,)),
                    SizedBox(height: 23.h,),
                    Container(
                      width: 96.w,
                      height: 120.h,
                      child: Column(
                        children: [
                          Image.asset("assets/image/personn.png",width: 75.w,height: 70.h),
                          Text("محمد علي",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.white,)),
                          Text("96654787856+",style: TextStyle(color: Color(0xffA2D273),fontSize: 12.sp,fontWeight: FontWeight.w300),)
                        ],
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 18.h,),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h),
                height: 190.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF6F6F6)),
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icon/User2.png"),
                        SizedBox(width: 9.w,),
                        Text("البيانات الشخصية",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),
                    Divider(height: 20.h),
                    GestureDetector(
                      onTap: () => navigatorTo(Wallet()),
                      child: Row(
                        children: [
                          Image.asset("assets/icon/Wallet.png"),
                          SizedBox(width: 9.w,),
                          Text("المحفظة",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),
                    ),
                    Divider(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icon/Location.png"),
                        SizedBox(width: 9.w,),
                        Text("العناوين",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),
                    Divider(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icon/pay.png"),
                        SizedBox(width: 9.w,),
                        Text("الدفع",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),


                  ],
                )
              ),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h),
                height: 244.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF6F6F6)),
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icon/Question.png"),
                        SizedBox(width: 9.w,),
                        Text("أسئلة متكررة",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),
                    Divider(height: 20.h),
                    GestureDetector(
                      onTap: () => navigatorTo(TermsView()),
                      child: Row(
                        children: [
                          Image.asset("assets/icon/Shieldcheck.png"),
                          SizedBox(width: 9.w,),
                          Text("سياسة الخصوصية",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),
                    ),
                    Divider(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icon/Calling.png"),
                        SizedBox(width: 9.w,),
                        Text("تواصل معنا",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),
                    Divider(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icon/Edit.png"),
                        SizedBox(width: 9.w,),
                        Text("الشكاوي والأقتراحات",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),
                    Divider(height: 20.h),
                    Row(
                      children: [
                        Image.asset("assets/icon/sharing.png"),
                        SizedBox(width: 9.w,),
                        Text("مشاركة التطبيق",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Image.asset("assets/icon/ArrowLeft.png")

                      ],
                    ),



                  ],
                )
              ),
              SizedBox(height: 20.h,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h),
                  height: 190.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF6F6F6)),
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icon/Info.png"),
                          SizedBox(width: 9.w,),
                          Text("عن التطبيق",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),
                      Divider(height: 20.h),
                      Row(
                        children: [
                          Image.asset("assets/icon/Lang.png"),
                          SizedBox(width: 9.w,),
                          Text("تغيير اللغة",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),
                      Divider(height: 20.h),
                      Row(
                        children: [
                          Image.asset("assets/icon/Note2.png"),
                          SizedBox(width: 9.w,),
                          Text("الشروط والأحكام",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),
                      Divider(height: 20.h),
                      Row(
                        children: [
                          Image.asset("assets/icon/Star.png"),
                          SizedBox(width: 9.w,),
                          Text("تقييم التطبيق",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Image.asset("assets/icon/ArrowLeft.png")

                        ],
                      ),


                    ],
                  )
              ),
              SizedBox(height: 20.h,),
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Row(
                  children: [


                    Text("تسجيل الخروج",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                    Spacer(),
                    Image.asset("assets/icon/Turn off.png")

                  ],
                ),
              ),
              SizedBox(height: 20.h,),

            ],
          )
        ],
      ),


    );
  }
}
