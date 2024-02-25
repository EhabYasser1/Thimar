import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/orders/current_order/bloc.dart';
import 'package:untitled3/features/orders/current_order/states.dart';
import 'package:untitled3/features/orders/finished_order/states.dart';

import '../../../features/orders/current_order/events.dart';
import '../../../features/orders/current_order/model.dart';
import '../../../features/orders/finished_order/bloc.dart';
import '../../../features/orders/finished_order/events.dart';
import '../other_pages/details_order.dart';

class TalabatyPage extends StatefulWidget {
  const TalabatyPage({super.key});

  @override
  State<TalabatyPage> createState() => _TalabatyPageState();
}

class _TalabatyPageState extends State<TalabatyPage> {
  final finishedBloc = KiwiContainer().resolve<FinishedOrderBloc>()..add(FinishedOrderEvent());
  final currentBloc = KiwiContainer().resolve<CurrentOrderBloc>()..add(CurrentOrderEvent());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("طلباتي"),
          bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: Theme.of(context).hintColor,
              padding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(context).primaryColor,
              ),
              tabs: [
                Tab(
                  child: Text(
                    "الحالية",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    "المنتهية",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
              ]),
        ),
        body: SafeArea(
            child: TabBarView(
          children: [
            BlocBuilder(
              bloc: currentBloc,
                builder: (context, state) {
              if (state is CurrentOrderFailedState) {
                return Text("failed");
              } else if (state is CurrentOrderSuccessState) {
                return ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => navigatorTo(DetailsOrder(id:  state.model.list[index].id,)),
                        child: ListVeiwItems(model: state.model.list[index])),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: state.model.list.length);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
            BlocBuilder(
              bloc: finishedBloc,
                builder: (context, state) {
                  if(state is FinishedOrderFailedState){
                    return Text("failed");
                  }else if(state is FinishedOrderSuccessState){
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>ListVeiwItems(model: state.model.list[index]) ,
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                        itemCount: state.model.list.length
                    );
                }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
            ),
          ],
        )),
      ),
    );
  }
}

class ListVeiwItems extends StatelessWidget {
  const ListVeiwItems({super.key, required this.model});
  final CurrentOrderModel model;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15.r),
            boxShadow: [BoxShadow(
            color: Color(0xff000000).withOpacity(.02),
        offset: Offset(0, 6),
        blurRadius: 17.r
        )]
        ),
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
                    "طلب #${model.id}",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                      "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ItemListImage(image: model.products[index].url),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 6.w),
                        itemCount: model.products.length),
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
                        "${model.status}",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Text(
                    "${model.orderPrice} ر.س  ",
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
    );
  }
}

class ItemListImage extends StatelessWidget {
  const ItemListImage({super.key, required this.image});
  final String image;

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
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
