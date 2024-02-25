
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:untitled3/views/my_account_screens/wallet.dart';

import '../../features/wallet/bloc.dart';
import '../../features/wallet/events.dart';
import '../../features/wallet/states.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();

}

class _TransactionHistoryState extends State<TransactionHistory> {
  final walletBloc = KiwiContainer().resolve<WalletBloc>()..add(GetWalletEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سجل المعاملات"),
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







