import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/orders/current_order/events.dart';
import 'package:untitled3/features/orders/current_order/states.dart';

import 'model.dart';

class CurrentOrderBloc extends Bloc<CurrentOrderEvents,CurrentOrderStates>{
  final DioHelper dioHelper;
  CurrentOrderBloc(this.dioHelper):super(CurrentOrderStates()){
    on<CurrentOrderEvent>(_getData);
  }
  Future<void>_getData(CurrentOrderEvent event,Emitter<CurrentOrderStates> emit)async{
    final response = await dioHelper.getData("client/orders/current");
    emit(CurrentOrderLoadingState());
    if(response.isSuccess){
      final model =CurrentOrderData.fromJson(response.response!.data);
      emit(CurrentOrderSuccessState(model: model));
    }else{
      emit(CurrentOrderFailedState());
    }
  }
}