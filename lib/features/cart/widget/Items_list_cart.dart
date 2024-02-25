import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc.dart';
import '../events.dart';
import '../model.dart';
import '../states.dart';

class ItemCart extends StatefulWidget {
  final CartModel model;
  const ItemCart({super.key, required this.model});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
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
                                            bloc.add(UpdateProductEvent(amount: widget.model.amount, id: widget.model.id));

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
                                            bloc.add(UpdateProductEvent(amount: widget.model.amount, id: widget.model.id));

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