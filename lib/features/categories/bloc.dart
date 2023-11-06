import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/categories/event.dart';
import 'model.dart';
import 'states.dart';

class CategoriesBloc extends Bloc<CategoryEvents,CategoriesStates> {
  CategoriesBloc() :super(CategoriesStates()){
    on<CategoryEvent>(_getCategory);
  }

  Future<void> _getCategory(CategoryEvent event,Emitter<CategoriesStates> emit) async {
    emit(CategoriesLoadingState());
    final response =await DioHelper().getData("categories");
    if (response.isSuccess) {
      final model = CategoriesData.fromJson(response.response!.data);
      emit(CategoriesSuccessState(
        list: model.list
      ));
    }else{
      emit(CategoriesFailedState(
        msg: response.message
      ));
    }
  }
}
