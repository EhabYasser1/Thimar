import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc.dart';
import '../states.dart';

class Botton extends StatefulWidget {
  final bool isOrder;
  final bool detailsOrder;
  const Botton({super.key,  this.isOrder=false, this.detailsOrder=false});


  @override
  State<Botton> createState() => _BottonState();
}

class _BottonState extends State<Botton> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartStates>(
      buildWhen: (previous, current) => current is CartLoadingStates || current is CartSuccessStates,
      builder: (context, state) {

        if (state is CartLoadingStates) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartSuccessStates) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: widget.isOrder ? 140.h:111.h,
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
                    widget.isOrder||widget.detailsOrder?
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
                          "-${state.model.totalDiscount}ر.س",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ):SizedBox(),
                    widget.detailsOrder?SizedBox():
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
    );

  }
}
