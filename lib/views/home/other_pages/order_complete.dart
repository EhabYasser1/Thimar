import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/design/app_button.dart';

import '../../../features/cart/bloc.dart';
import '../../../features/cart/events.dart';
import '../../../features/cart/widget/botton.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({
    super.key,
  });

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  initState() {
    final bloc = BlocProvider.of<CartBloc>(context)..add(CartEvent());
    super.initState();
  }
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
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
        title: Text("إتمام الطلب"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Text(
            "الإسم : محمد",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "الجوال : 05068285914",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 75.h,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "اختر عنوان التوصيل",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      height: 26.h,
                      width: 26.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: Theme.of(context).primaryColor.withOpacity(.14),
                      ),
                      child: IconButton(
                        padding: EdgeInsetsDirectional.only(
                          bottom: 2.h,
                        ),
                        icon: Image.asset("assets/icon/add.png"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17.r),
                      border: Border.all(color: Color(0xff4C8613))),
                  child: Row(
                    children: [
                      Text(
                        "المنزل : 119 طريق الملك عبدالعزيز",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/icon/ArrowDown.png",
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            height: 95.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تحديد وقت التوصيل",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()async {
                          final DateTime? dateTime= await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1990), lastDate: DateTime(2100));
                          if(dateTime == null) return;
                          setState(() {
                            selectedDate=dateTime;
                          });
                        },
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffF3F3F3)),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اختر اليوم والتاريخ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Image.asset("assets/icon/Calendar.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()async{
                     final TimeOfDay? timeOfDay = await showTimePicker(context: context, initialTime: selectedTime,initialEntryMode: TimePickerEntryMode.dial);
                     if(timeOfDay != null){
                       setState(() {
                         selectedTime=timeOfDay;
                       });
                     }

                        },
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffF3F3F3),
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اختر الوقت",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Image.asset("assets/icon/time.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            height: 145.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ملاحظات وتعليمات",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 4,
                  minLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide(color: Color(0xffE5E5E5)))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            height: 95.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اختر طريقة الدفع",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 49.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF3F3F3)),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icon/money.png"),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              "كاش",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 49.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF3F3F3)),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Image.asset("assets/icon/visa.png"),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 49.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF3F3F3)),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Image.asset("assets/icon/MrCard.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(
            "ملخص الطلب",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
          Botton(
            isOrder: true,
          ),
          SizedBox(
            height: 13.h,
          ),
          AppButton(
            text: "إنهاء الطلب",
            onPressed: () {
              showModalBottomSheet(backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 10.h),
                  height: 450.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:  Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                  child: Column(
                    children: [
                      Transform.scale(

                        child: Image.asset(
                          "assets/image/finish.png",
                          fit: BoxFit.contain,
                          height: 222.h,
                        ),
                        scale: .9,
                      ),
                      Text(
                        "شكرا لك لقد تم تنفيذ طلبك بنجاح",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "يمكنك متابعة حالة الطلب او الرجوع للرئسيية",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffACACAC)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              text: "طلباتي",
                              onPressed: () {},
                            ),
                          ),
                           SizedBox(width: 16.w,),
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {},

                                child: Text(
                                  "الرئيسية",
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
