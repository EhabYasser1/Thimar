import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../current_order/model.dart';
import 'events.dart';
import 'states.dart';

class FinishedOrderBloc extends Bloc<FinishedOrderEvents,FinishedOrderStates>{
  final DioHelper dioHelper;
  FinishedOrderBloc(this.dioHelper):super(FinishedOrderStates()){
    on<FinishedOrderEvent>(_getData);
  }
  Future<void>_getData(FinishedOrderEvent event,Emitter<FinishedOrderStates> emit)async {
    emit(FinishedOrderLoadingState());
    final response =await dioHelper.getData("client/orders/finished");
    if(response.isSuccess){
      final model = CurrentOrderData.fromJson(response.response!.data);
      emit(FinishedOrderSuccessState(model: model));
    }else{
      emit(FinishedOrderFailedState());
    }
  }
  
}