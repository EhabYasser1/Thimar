import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';

import 'events.dart';
import 'model.dart';
import 'states.dart';

class FavoriteBloc extends Bloc<GetFavoriteEvents,GetFavoritesStates> {
  FavoriteBloc():super(GetFavoritesStates()){
    on<GetFavoriteEvent>(_getFavoriteData);
  }
  Future<void>_getFavoriteData(GetFavoriteEvent event,Emitter<GetFavoritesStates>emit)async{
    emit(GetFavoriteLoadingStates());
    final response =await DioHelper().getData("client/products/favorites",);

    if(response.isSuccess){
      final model =FavoriteData.fromJson(response.response!.data);
      emit(GetFavoriteSuccessStates(list: model.list));
    }else{
      emit(GetFavoriteFailedStates(msg: response.message));
    }
  }
}