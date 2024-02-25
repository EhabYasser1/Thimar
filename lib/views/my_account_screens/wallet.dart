
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/wallet/events.dart';
import 'package:untitled3/features/wallet/states.dart';

import '../../features/wallet/bloc.dart';
import '../../features/wallet/model.dart';
import 'Transaction_history.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final walletBloc = KiwiContainer().resolve<WalletBloc>()..add(GetWalletEvent());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
        title: Text("المحفظة"),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: walletBloc,
          builder: (context, state) {
            if(state is GetWalletFailedState){
               return Text("falied");
            }else if(state is GetWalletSuccessState){
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Container(
                    height: 170.h,
                    child: Column(
                      children: [
                        Text("رصيدك",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                        SizedBox(height: 17.h,),
                        Text("255 ر.س",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {

                    },
                        child: Text("اشحن الآن",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.sp),)),
                  ),
                  SizedBox(height:59.h),
                  Row(
                    children: [
                      Text("سجل المعاملات",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                      Spacer(),
                      TextButton(onPressed: () {
                        navigatorTo(TransactionHistory());

                      }, child:Text("عرض الكل",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w300,fontSize: 15.sp),),
                      )
                    ],
                  ),
                  SizedBox(height: 19.h,),
                  SizedBox(height: 400,child: ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder:(context, index) =>  Items1Wallet(model: state.model.list[index],), separatorBuilder:(context, index) =>  SizedBox(height: 20.h), itemCount: state.model.list.length))
                ],
              );

          }else{
               return Center(child: CircularProgressIndicator());
            }
          },

        ),
      ),
    );
  }
}


class Items1Wallet extends StatelessWidget {
  
  const Items1Wallet({super.key, required this.model, });
  final  WalletModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:model.isCharge? 83.h:145.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(.02),
            offset: Offset(0, 1),
            blurRadius: 11
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              model.isCharge?SvgPicture.asset("assets/icon/svg/ArrowTop.svg")
            :SvgPicture.asset("assets/icon/svg/ArrowBotton.svg"),
              SizedBox(width: 9.w,),
              model.isCharge?Text(model.statusTrans,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.sp),)
                  :Text(model.statusTrans,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.sp),),
              Spacer(),
              Text(model.date,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Color(0xff9C9C9C)),)
            ],
          ),
          model.isCharge?SizedBox():SizedBox(height: 17.h,),
          model.isCharge?Padding(
            padding:  EdgeInsets.only(right: 33.w),
            child: Text("${model.afterCharge},ر.س",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24.sp,fontWeight: FontWeight.bold),),
          ):Container(
            height: 83.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: Color(0xffD1D1D1).withOpacity(.10),
                )
              ],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("طلب #${model.id}",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.sp,fontWeight:FontWeight.bold),),
                SizedBox(height: 35.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ListImage(image: model.image[index].url,), separatorBuilder: (context, index) => SizedBox(width: 6.w), itemCount: model.image.length),
                      ),
                      Text("${model.afterCharge},ر.س",style: TextStyle(fontSize: 13.sp,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w900),)

                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ) ,
    );
  }
}




class ListImage extends StatefulWidget {
  const ListImage({super.key, required this.image, });
  final String image;

  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
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
        widget.image,
        fit: BoxFit.fill,
      ),
    ) ;
  }
}