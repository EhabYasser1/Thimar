import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/cart/events.dart';
import 'package:untitled3/features/cart/states.dart';
import 'package:untitled3/features/cart/widget/botton.dart';

import '../../../core/design/app_button.dart';
import '../../../features/cart/bloc.dart';
import '../../../features/cart/widget/Items_list_cart.dart';
import 'order_complete.dart';


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
                bottom: 2.h,
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
              buildWhen: (previous, current) => current is CartLoadingStates || current is CartSuccessStates,
              builder: (context, state) {
                if (state is CartLoadingStates) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CartSuccessStates) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ItemCart(model: state.model.list[index]),
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
          Botton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              text: "الانتقال لإتمام الطلب",
              onPressed: () {
                navigatorTo(OrderComplete());
              },
            ),
          )
        ],
      ),
    );
  }
}


