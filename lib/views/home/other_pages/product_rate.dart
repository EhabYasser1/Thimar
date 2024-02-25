
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/product_rate/events.dart';

import '../../../features/product_rate/bloc.dart';
import '../../../features/product_rate/model.dart';
import '../../../features/product_rate/states.dart';

class ReviewScreen extends StatefulWidget {
   final int id ;
  const ReviewScreen({super.key, required this.id,});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProRateBloc()..add(ProductRateEvent(id: widget.id)),
      child: BlocBuilder<ProRateBloc,ProductRateStates>(
        builder: (context, state) {
          if(state is RateLoadingStates){
            return Center(child: CircularProgressIndicator());
          }else if (state is RateSuccessStates){
            return state.list.isEmpty?Text("لا يوجد تقيمات",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300,color: Color(0xff757575)),):
              SizedBox(
                height: 100.h,
                child: ListView.separated(

                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ListViewRate(model: state.list[index]),
                    separatorBuilder: (context, index) => SizedBox(width: 8.w),
                    itemCount: state.list.length)
            );
          }else{
            return Text("Faild");
          }
        },
      ),
    );

  }
}




class ListViewRate extends StatelessWidget {
  final DataRateModel model;
  const ListViewRate({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 18.h,bottom: 5.h),
     width: 260.w,

      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 4.h),
                child: Row(
                  children: [
                    SizedBox(
                      width:110.w ,
                      child: Text(model.clientName,
                        style: TextStyle(color: Colors.black,fontSize: 16.sp),),
                    ),
                    RatingBarIndicator(
                      direction: Axis.horizontal,
                      itemSize: 14.sp,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                      itemCount: 5,
                      rating: model.value,
                        itemBuilder: (context, index) => Icon(index>=model.value?Icons.star_outline:Icons.star_outlined,color: Color(0xffFF9529)),)

                  ],
                ),
              ),
              SizedBox(height: 6.h,),
               SizedBox(
                 width: 180.w,
                 height: 42.h,
                 child: Text(model.comment,
                   style:TextStyle(fontSize: 14.sp,color: Color(0xff757575)) ,
                 ),
               ),

            ],
          ),
          ClipRRect(borderRadius: BorderRadius.circular(16.r),
              child: Image.network(model.clientImage,width: 56.w,height: 56.h,fit: BoxFit.cover,))
        ],
      ),
    );

  }
}