import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

import '../../../core/logic/dio_helper.dart';

import '../confirm_code/view.dart';
import 'events.dart';
import 'states.dart';

class ForgotBloc extends Bloc<ForgotPasswordEvents,ForgotStates>{
  ForgotBloc():super(ForgotStates()){
    on<ForgotPasswordEvent>(_forgot);
  }
  final phoneController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void>_forgot(ForgotPasswordEvent event,Emitter<ForgotStates> emit)async{
    if(formKey.currentState!.validate()){
      emit(ForgotLoadingState());
      final response = await DioHelper().sendData("forget_password",
      data: {
        "phone":phoneController.text
      }
      );
      if(response!.isSuccess){
        showMessage(response.message,type: MessageType.success);
        navigatorTo(ConfirmCodeView(isActive: false, phone: phoneController.text));
        emit(ForgotSuccessState());
      }else{
        showMessage(response.message);
        emit(ForgotFailedState());
      }

    }

  }
}
