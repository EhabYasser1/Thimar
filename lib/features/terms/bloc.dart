import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/terms/events.dart';
import 'package:untitled3/features/terms/model.dart';
import 'package:untitled3/features/terms/states.dart';

import '../../core/logic/dio_helper.dart';

class TermBloc extends Bloc<TermEvents,TermStates>{
  final DioHelper dioHelper;

  TermBloc(this.dioHelper):super(TermStates()){
    on<GetTermEvent>(_getData);


  }
  Future<void>_getData(GetTermEvent event,Emitter<TermStates> emit)async{
    emit(TermLoadingState());
    final response = await dioHelper.getData("terms");
    if(response.isSuccess){
      final model= TermsData.fromJson(response.response!.data);
      emit(TermSuccessState(model: model.data));
    }else{
      emit(TermFailedState());
    }
  }
}