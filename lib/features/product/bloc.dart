
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/product/events.dart';
import 'package:untitled3/features/product/model.dart';
import 'package:untitled3/features/product/states.dart';

class ProductsBloc extends Bloc<ProductEvents,ProductsStates>{
  ProductsBloc():super(ProductsStates()){
    on<ProductEvent>(_getData);
  }
  Future<void>_getData(ProductEvent event,Emitter<ProductsStates> emit)async{
    emit(ProductsLoadingState());
     final response=await DioHelper().getData("products");
    if(response.isSuccess){
      final model= ProductsData.fromJson(response.response!.data);
      emit(ProductsSuccessState(list: model.list));
    }else{
      emit(ProductsFailedState(msg: response.message));
    }
  }
  
}