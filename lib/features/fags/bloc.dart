import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/fags/events.dart';
import 'package:untitled3/features/fags/model.dart';
import 'package:untitled3/features/fags/states.dart';

import '../../core/logic/dio_helper.dart';

class FagsBloc extends Bloc<FagsEvents,FagsStates>{
  final DioHelper dioHelper;
 late List<FagsModel> list;
  FagsBloc(this.dioHelper, ):super(FagsStates()){
    on<GetFagsEvent>(_getData);
  }
  Future<void>_getData(GetFagsEvent event,Emitter<FagsStates>emit)async{
    emit(FagsLoadingState());
    final response = await dioHelper.getData("faqs");
    if(response.isSuccess){
      // final model=FagsData.fromJson(response.response!.data);
      list=List.from(response.response!.data).map((e)=>FagsModel.fromJson(e)).toList();
      emit(FagsSuccessState(list:list));
    }else{
      emit(FagsFailedState());
    }
 }

}