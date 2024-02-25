import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/contact/events.dart';
import 'package:untitled3/features/contact/model.dart';

import '../../core/logic/dio_helper.dart';
import 'states.dart';

class ContactBloc extends Bloc<ContactEvents,ContactStates>{
  final DioHelper dioHelper;
  ContactBloc(this.dioHelper):super(ContactStates()){
    on<GetContactEvent>(_getData);
    on<PostContactEvent>(_postData);
  }
  Future<void>_getData(GetContactEvent event,Emitter<ContactStates>emit)async{
    final response = await dioHelper.getData("contact");
    if(response.isSuccess){
      final model= ContactData.fromJson(response.response!.data);
      emit(ContactSuccessState(model: model.data));
    }else{
      emit(ContactFailedState());
    }
  }
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  final formKey = GlobalKey<FormState>();


  Future<void>_postData(PostContactEvent event,Emitter<ContactStates>emit)async{
    if(formKey.currentState!.validate()) {
      emit(ContactSendLoadingState());
      final response = await dioHelper.sendData("contact",
          data: {
            "fullname": nameController.text,
            "phone": phoneController.text,
            "title": titleController.text,
            "content": "test test"
          }
      );
      if (response!.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        emit(ContactSendSuccessState());
      } else {
        showMessage(response.message);
        emit(ContactSendFailedState());
      }
    }
  }
}