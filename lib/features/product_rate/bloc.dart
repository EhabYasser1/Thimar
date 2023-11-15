import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/product/states.dart';

import 'events.dart';
import 'model.dart';
import 'states.dart';

class ProRateBloc extends Bloc<ProductRateEvents,ProductRateStates>{
  ProRateBloc():super(ProductRateStates()){
    on<ProductRateEvent>(_getRate);
  }
  Future<void> _getRate(ProductRateEvent event,Emitter<ProductRateStates>emit)async {
    emit(RateLoadingStates());
    final response = await DioHelper().getData("products/${event.id}/rates");
    if(response.isSuccess){
      final model= ProductRate.fromJson(response.response!.data,);
      emit(RateSuccessStates(list: model.list));
    }else{
      emit(RateFailedStates(msg: response.message));
    }
  }
}

