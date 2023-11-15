import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/help_navigator.dart';
import '../confirm_password/view.dart';
import '../login_view/view.dart';
import 'events.dart';
import 'states.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvents,ConfirmCodeStates>{
  ConfirmCodeBloc():super(ConfirmCodeStates()){
    on<ConfirmCodeEvent>(_verify);
    on<CheckCodeEvent>(_checkCode);
  }
  final codeController=TextEditingController();
  bool isTimerFinished = false;
  final formKey = GlobalKey<FormState>();


  Future<void> _verify(ConfirmCodeEvent event,Emitter<ConfirmCodeStates> emit) async {
    if(formKey.currentState!.validate()) {
      emit(ConfirmCodeLoadingState());
      final response = await DioHelper().sendData("verify",
          data: {
            "phone": event.phone,
            "code": codeController.text,
            "type": Platform.operatingSystem,
            "device_token": "test",

          }
      );
      if (response!.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        navigatorTo(const LoginView());
        emit(ConfirmCodeSuccessState());
      } else {
        showMessage(response.message);
        emit(ConfirmCodeFailedState());
      }
    }
  }

  Future<void> _checkCode(CheckCodeEvent event,Emitter<ConfirmCodeStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(ConfirmCodeLoadingState());
      final response = await DioHelper().sendData("check_code",
          data: {
            "phone": event.phone,
            "code": codeController.text,

          }

      );
      if(response!.isSuccess){
        showMessage(response.message, type: MessageType.success);
        navigatorTo(const ConfirmPasswordView());
        //navigatorTo(ConfirmCodeView(isActive: false, phone: event.phone));
        emit(ConfirmCodeSuccessState());
      }else{
        showMessage(response.message);
        emit(ConfirmCodeFailedState());
      }
    }
  }
}
