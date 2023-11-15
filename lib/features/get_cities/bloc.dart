
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/get_cities/events.dart';
import 'package:untitled3/features/get_cities/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/cities.dart';


class GetCitiesBloc extends Bloc <CitiesEvents,GetCitiesStates>{
  GetCitiesBloc():super(GetCitiesStates()){
    on<CitiesEvent>(_getData);

  }
  //late GetCitiesData model;

  Future<void>  _getData(CitiesEvent event,Emitter<GetCitiesStates> emit) async {

    emit(GetCitiesLoadingStates());
    final response=await DioHelper().getData("cities/1");
    if(response.isSuccess){
     final model = GetCitiesData.fromJson(response.response!.data);
      emit(GetCitiesSuccessStates(list: model.list));

    }else{

      emit(GetCitiesFailedStates());
    }


    //await Future.delayed(Duration(seconds: 2));

  }
}