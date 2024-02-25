import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/features/fags/bloc.dart';
import 'package:untitled3/features/fags/events.dart';
import 'package:untitled3/features/fags/states.dart';

class FagsView extends StatefulWidget {
  const FagsView({super.key});

  @override
  State<FagsView> createState() => _FagsViewState();
}

class _FagsViewState extends State<FagsView> {
  final fagsBloc = KiwiContainer().resolve<FagsBloc>()
    ..add(GetFagsEvent());

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
              color: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(.14),
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
        title: Text("أسئلة متكررة"),
      ),
      body: BlocBuilder(
        bloc: fagsBloc,
        builder: (context, state) {
          if (state is FagsFailedState) {
            return Text("Failed");
          } else if (state is FagsSuccessState) {
            return ListView.separated(
                itemBuilder: (context, index) =>
                    Container(
                      padding: EdgeInsets.only(right: 16,left: 16,top: 16),

                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Color(0xff000000).withOpacity(.02),
                          offset: Offset(0, 6),
                          blurRadius: 17
                        )],
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(11.r)
                      ),
                      child: ExpansionTile(
                        // collapsedBackgroundColor: Color(0xff4C8613).withOpacity(.13),
                        collapsedIconColor: Theme.of(context).primaryColor,
                         trailing: Container(
                           height: 20.h,
                           width: 20.w,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.r),
                                 color: Color(0xff4C8613).withOpacity(.13),

                           ),
                           child: Icon(Icons.arrow_drop_down,size: 20,),
                         ),
                        title: Text(state.list[index].question,
                        style: TextStyle(fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(context)
                                .primaryColor),),
                        children: [
                          Text(state.list[index].answer)
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: state.list.length);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}

