
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/product/events.dart';
import 'package:untitled3/features/product/model.dart';
import 'package:untitled3/features/product/states.dart';

class ProductsBloc extends Bloc<ProductEvents,ProductsStates>{
  ProductsBloc():super(ProductsStates()){
    on<ProductEvent>(_getData);
    on<FavoritesAddEvent>(_addFav);

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
  Future<void>_addFav(FavoritesAddEvent event ,Emitter<ProductsStates>emit)async {
    emit(FavoriteLoadingStates());
    final response = await DioHelper().sendData("client/products/${event.model.id}/${event.model.isFavorite ? "remove_from_favorite" : "add_to_favorite"}",haveToken: true);
    if(response!.isSuccess){
      event.model.isFavorite=!event.model.isFavorite;
      showMessage(response.message,type: MessageType.success);
      emit(FavoriteSuccessStates());

    }else{
      showMessage(response.message);
      emit(FavoriteFailedStates());
    }

  }
  // Future<void>_removeFav(FavoritesRemoveEvent event ,Emitter<ProductsStates>emit)async {
  //   emit(FavoriteLoadingStates());
  //   final response = await DioHelper().sendData("client/products/${event.id}/remove_from_favorite",haveToken: true);
  //   if(response!.isSuccess){
  //     isFavo=false;
  //     showMessage(response.message,type: MessageType.success);
  //     emit(FavoriteSuccessStates());
  //
  //   }else{
  //     showMessage(response.message);
  //     emit(FavoriteFailedStates());
  //   }
  //
  // }
  
}