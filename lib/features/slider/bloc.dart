import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/slider/events.dart';
import 'model.dart';
import 'states.dart';

class SlidersBloc extends Bloc<SliderEvents,SliderStates> {
  final DioHelper dioHelper;
  SlidersBloc(this.dioHelper) :super(SliderStates()){
    on<SliderEvent>(_getData);

  }

  Future<void> _getData(SliderEvent event,Emitter<SliderStates> emit) async {
    emit(SliderLoadingState());
    final response =await dioHelper.getData("sliders",);
    if (response.isSuccess) {
      final model = SlidersData.fromJson(response.response!.data);
      emit(SliderSuccessState(list: model.list));
    }else{
      emit(SliderFailedState(
        msg: response.message
      ));
    }
  }
}
