import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/orders/order_details/events.dart';
import 'package:untitled3/features/orders/order_details/states.dart';

import 'model.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvents,OrderDetailsStates>{
  final DioHelper dioHelper ;
  OrderDetailsBloc(this.dioHelper):super(OrderDetailsStates()){
    on<OrderDetailsEvent>(_getData);

  }
  Future<void>_getData(OrderDetailsEvent event,Emitter<OrderDetailsStates> emit)async{
    emit(OrderDetailsLoadingState());

    final response = await  dioHelper.getData("client/orders/${event.id}");
    if(response.isSuccess){
      final model = OrderDetailsData.fromJson(response.response!.data);
      emit(OrderDetailsSuccessState(model: model));
      showMessage(response.message,type: MessageType.success);
    }else{
      emit(OrderDetailsFailedState());
      showMessage(response.message);
    }
  }

}
