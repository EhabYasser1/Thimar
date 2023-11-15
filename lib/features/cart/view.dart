import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/cart/events.dart';
import 'package:untitled3/features/cart/states.dart';

import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';
import 'bloc.dart';
import 'model.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  initState() {
    final bloc = BlocProvider.of<CartBloc>(context)..add(CartEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                bottom: 2,
              ),
              icon: Image.asset("assets/icon/arrowR.png"),
              onPressed: () {},
            ),
          ),
        ),
        title: Text("السلة"),
      ),
      body: ListView(
        children: [
          Builder(builder: (context) {
            return BlocBuilder<CartBloc, CartStates>(
              builder: (context, state) {
                if (state is CartLoadingStates) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CartSuccessStates) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ListCart(model: state.model.list[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 1.h),
                      itemCount: state.model.list.length);
                } else if(state is CartFailedStates){
                  return Text("Failed");
                }
                else{
                  return SizedBox();
                }
              },
            );
          }),
          SizedBox(
            height: 4.h,
          ),
          Container(
              height: 55.h,
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "عندك كوبون ؟ ادخل رقم الكوبون",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(
                        text: 'تطبيق',
                        onPressed: () {},
                      ),
                    )),
              )),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: Text("جميع الأسعار تشمل قيمة الضريبة المضافة 15%",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor))),
          BlocBuilder<CartBloc, CartStates>(
            builder: (context, state) {
              if (state is CartLoadingStates) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CartSuccessStates) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 111.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F8EE),
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
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
                                "${state.model.totalPriceBeforeDiscount}ر.س",
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
                                "الخصم",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "-${state.model.totalDiscount}ر.س",
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
                                "${state.model.totalPriceWithVat}ر.س",
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
                );
              } else {
                return Text("failed");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              text: "الانتقال لإتمام الطلب",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class ListCart extends StatefulWidget {
  final CartModel model;
  const ListCart({super.key, required this.model});

  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  @override

  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          CartBloc bloc = BlocProvider.of(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.2),
                    offset: Offset(0, 6),
                    blurRadius: 17.r,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
                child: Row(
                  children: [
                    Container(
                      height: 80.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Image.network(
                        widget.model.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 9.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.model.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "${widget.model.price} ر.س",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            width: 72.w,
                            height: 27.h,
                            decoration: BoxDecoration(
                                color:
                                Theme.of(context).primaryColor.withOpacity(.11),
                                borderRadius: BorderRadius.circular(9.r)),
                            child: Padding(
                              padding: EdgeInsets.all(3.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 23.h,
                                      width: 23.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.r),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                          padding:
                                          EdgeInsetsDirectional.only(bottom: 2.h),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            widget.model.amount++;
                                            setState(() {

                                            });
                                          },
                                          icon: const Icon(size: 15, Icons.add))),
                                  Text("${widget.model.amount}"),
                                  Container(
                                      height: 23.h,
                                      width: 23.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.r),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                          padding:
                                          EdgeInsetsDirectional.only(bottom: 2.h),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            widget.model.amount--;
                                            setState(() {

                                            });




                                          },
                                          icon: const Icon(size: 15, Icons.remove))),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    BlocBuilder<CartBloc,CartStates>(
                      builder:(context,state)=> Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: 29.w,
                          height: 29.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: Color(0xffFF0000).withOpacity(.11)),
                          child: IconButton(
                            onPressed: () {
                              bloc.add(DelProductEvent(model: widget.model));

                            },
                            icon: Image.asset("assets/icon/trash.png"),
                          ),
                        ),
                      ),
                    )
                    // BlocBuilder<CartBloc,CartStates>(
                    //         builder:(context, state) => state is DeleteSuccessStates?Padding(
                    //       padding: EdgeInsets.only(left: 10.h),
                    //   child: Container(
                    //     width: 29.w,
                    //     height: 29.h,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(7.r),
                    //         color: Color(0xffFF0000).withOpacity(.11)),
                    //     child: IconButton(
                    //       onPressed: () {
                    //         bloc.add(DelProductEvent(id: model.id));
                    //       },
                    //       icon: Image.asset("assets/icon/trash.png"),
                    //     ),
                    //   ),
                    // )
                    //


                    // )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
