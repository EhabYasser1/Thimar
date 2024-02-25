import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/addresses/events.dart';
import 'package:untitled3/features/addresses/model.dart';
import 'package:untitled3/features/addresses/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/help_navigator.dart';

class AddressBloc extends Bloc<AddressEvents,AddressStates>{
  final DioHelper dioHelper; 
  AddressBloc(this.dioHelper):super(AddressStates()){
    on<GetAddressEvent>(_getData);
    on<AddAddressEvent>(_SendData);
  }
  final phoneController =TextEditingController();
  final discriptionController =TextEditingController();
  final formKey= GlobalKey<FormState>();
  Future<void>_getData(GetAddressEvent event,Emitter<AddressStates>emit)async{
    emit(GetAddressLoadingState());
    final response= await dioHelper.getData("client/addresses");
    if(response.isSuccess){
  final    model = AddressData.fromJson(response.response!.data);
      emit(GetAddressSuccessState(list: model.list));
    }else{
      emit(GetAddressFailedState());
    }
  }


  Future<void>_SendData(AddAddressEvent event,Emitter<AddressStates>emit)async{
    emit(AddAddressLoadingState());
   final response = await dioHelper.sendData("client/addresses",
       data:{
     "type":event.type,
         "phone":event.phone,
         "description":event.description,
         "location":"test",
         "lat":event.lat,
         "lng":event.lng,
         "is_default":"1"
       }
   );
   if(response!.isSuccess){
     showMessage(response.message,type: MessageType.success);
     emit(AddAddressSuccessState());
   }else{
     showMessage(response.message);
     emit(AddAddressFailedState());
   }
  }
}