import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/features/orders/order_details/bloc.dart';
import 'package:untitled3/features/orders/order_details/states.dart';

import '../../../features/orders/order_details/events.dart';
import '../../../features/orders/order_details/model.dart';
import '../../../features/product/bloc.dart';

class DetailsOrder extends StatefulWidget {
  const DetailsOrder({super.key, required this.id});

  final int id;

  @override
  State<DetailsOrder> createState() => _DetailsOrderState();
}

class _DetailsOrderState extends State<DetailsOrder> {
  @override
  final orderBloc = KiwiContainer().resolve<OrderDetailsBloc>();

  @override
  void initState() {
    orderBloc.add(OrderDetailsEvent(id: widget.id));
    super.initState();
  }

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
        title: Text("تفاصيل الطلب"),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        child: BlocBuilder(
            bloc: orderBloc,
            builder: (context, state) {
              if (state is OrderDetailsFailedState) {
                return Text("failed");
              } else if (state is OrderDetailsSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(.02),
                            offset: Offset(0, 6),
                            blurRadius: 17)
                      ], borderRadius: BorderRadius.circular(15.r)),
                      width: double.infinity,
                      height: 100.h,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "طلب #${state.model.list.id}",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text("${state.model.list.date}"),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          ItemListImage2(),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 6.w),
                                      itemCount: 3),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${state.model.list.status}",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 31.h,
                                ),
                                Text(
                                  "${state.model.list.priceBeforeDiscount} ر.س  ",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "عنوان التوصيل",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      height: 83.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${state.model.list.address.type}",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${state.model.list.address.location}",
                                style: TextStyle(
                                    color: Color(0xff999797),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "${state.model.list.address.description}",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Image.asset(
                            alignment: AlignmentDirectional.centerEnd,
                            "assets/icon/address.png",
                            height: 62.h,
                            width: 72.w,
                            fit: BoxFit.contain,
                          ))
                        ],
                      ),
                    ),
                    Text(
                      "ملخص الطلب",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 148.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF3F8EE),
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.w, vertical: 3.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "إجمالي المنتجات",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  "${state.model.list.orderPrice}ر.س",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "سعر التوصيل",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  "${state.model.list.deliveryPrice}ر.س",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "المجموع",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "${state.model.list.totalPrice}ر.س",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 180.h),
                    state.model.list.buttonType
                        ? AppButton(
                            text: "text",
                            onPressed: () {},
                          )
                        : Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                  onPressed: () {},
                                  child: Text("الغاء الطلب",style: TextStyle(color: Color(0xffFF0000),fontSize: 15.sp,fontWeight: FontWeight.bold)),
                                  style: FilledButton.styleFrom(
                                    fixedSize:Size.fromHeight(60.h) ,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.r)),
                                      backgroundColor: Color(0xffFFE1E1)),
                                ),
                            ),
                          ],
                        )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class ItemListImage2 extends StatelessWidget {
  const ItemListImage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Image.network(
        "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
        fit: BoxFit.fill,
      ),
    );
  }
}
