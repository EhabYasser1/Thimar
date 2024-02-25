
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/features/terms/bloc.dart';
import 'package:untitled3/features/terms/events.dart';
import 'package:untitled3/features/terms/states.dart';

import '../../core/design/appBar.dart';

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
final termBloc = KiwiContainer().resolve<TermBloc>()..add(GetTermEvent());

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
      body: BlocBuilder(
        bloc: termBloc,
        builder:(context, state) {
        if(state is TermFailedState){
          return Text("failed");
        }else if(state is TermSuccessState){
          return ListView(
            padding: EdgeInsets.all(16.r),
            children: [
              Text(state.model.terms)

            ],
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },

      ),
    );
  }
}
