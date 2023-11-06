import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/help_navigator.dart';
import '../../../models/cities.dart';

import '../confirm_code/view.dart';

import 'events.dart';
import 'states.dart';

class RegisterBloc extends Bloc<RegisterEvents,RegisterStates> {
  RegisterBloc():super(RegisterStates()){
    on<RegisterEvent>(_register);

  }
  final phoneController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final nameController=TextEditingController();
 // bool isLoading=false;
  CityModel? selectedModel;
  final formKey = GlobalKey<FormState>();
  Future<void> _register(RegisterEvent event,Emitter<RegisterStates> emit) async {
    if(formKey.currentState!.validate()) {
      emit(RegisterLoadingStates());
      final response = await DioHelper().sendData("client_register",
          data: {
            "fullname": nameController.text,
            "password": passwordController.text,
            "password_confirmation": confirmPasswordController.text,
            "phone": phoneController.text,
            "country_id": 1,
            "city_id": selectedModel!.id
          });
      if (response!.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        emit(RegisterSuccessStates());
        navigatorTo(ConfirmCodeView(isActive: true, phone: phoneController.text,));
      } else {
        showMessage(response.message);
        emit(RegisterFailedStates());
      }
    }
  }
}

