import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/help_navigator.dart';

import '../../home/view.dart';

import 'events.dart';
import 'states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates> {
  LoginBloc():super(LoginStates()){
    on<LoginEvent>(_login);
  }
  final formKey = GlobalKey<FormState>();
  final phoneController=TextEditingController();
  final passwordController=TextEditingController();

  Future<void> _login(LoginEvent event,Emitter<LoginStates> emit) async {
    if(formKey.currentState!.validate()){
      emit(LoginLoadingStates());
      final response=await DioHelper().sendData("login",
          data: {
            "phone":phoneController.text,
            "password":passwordController.text,
            "type":Platform.operatingSystem,
            "device_token":"test",
            "user_type":"client"
          }
      );
      if(response!.isSuccess){
        showMessage(response.message,type: MessageType.success);
        emit(LoginSuccessStates());
        navigatorTo(const HomeView());
      }else{
        showMessage(response.message);
        emit(LoginFailedStates());
      }
    }
  }
}

