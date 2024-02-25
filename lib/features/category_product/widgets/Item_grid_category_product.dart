import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../product/model.dart';

class ItemsGridCategoryProduct extends StatelessWidget {
  final ProductModel model;

  const ItemsGridCategoryProduct({super.key, required this.model});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      width: 165.w,
      padding:  EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 11.r,
          )
        ],
        borderRadius: BorderRadius.circular(17.r),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11.r),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.network(model.mainImage,fit: BoxFit.fill,height: 120.h,width: double.infinity, ),
                Container(
                  padding:  EdgeInsets.symmetric(
                    vertical: 3.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:  BorderRadiusDirectional.only(bottomStart: Radius.circular(11.r)),

                  ),
                  child:  Text(
                    "${model.discount}%",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3.h,),
          Text(model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text("السعر/ 1كجم",
            style: TextStyle(color: Color(0xff808080),fontSize: 12.sp,fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text.rich(
              TextSpan(
                  text: "${model.priceBeforeDiscount} ر.س",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children:  [TextSpan(text: "\t"),
                    TextSpan(text:"${model.price} ر.س" ,style:
                    TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13.sp,fontWeight: FontWeight.bold))]
              )
          ),



        ],
      ),
    );
  }
}