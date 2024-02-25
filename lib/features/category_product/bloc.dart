import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/category_product/events.dart';
import 'package:untitled3/features/category_product/states.dart';

import 'model.dart';

class CategoryProductBloc extends Bloc<CategoryProductEvents,CategoryProductStates>{
  CategoryProductBloc():super(CategoryProductStates()){
    on<CategoryProductEvent>(_getCategoryData);
    
  }
  Future<void>_getCategoryData(CategoryProductEvent event,Emitter<CategoryProductStates> emit)async{
    emit(CategoryProductLoadingStates());
    final response =await DioHelper().getData("products",data: {
      "category_id":event.model.id
    },);

    if(response.isSuccess){
      final model=CategoryProductData.fromJson(response.response!.data);
      showMessage(response.message,type: MessageType.success);
      emit(CategoryProductSuccessStates(list: model.list));

    }else{
      showMessage(response.message,);

      emit(CategoryProductFailedStates(msg: response.message));
    }
  }
}