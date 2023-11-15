import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/cart/events.dart';
import 'package:untitled3/features/cart/states.dart';
import 'package:untitled3/features/cart/view.dart';

import 'model.dart';

class CartBloc extends Bloc<CartEvents,CartStates>{
  CartBloc():super(CartStates()){
    on<CartEvent>(_getCart);
    on<DelProductEvent>(_deleteProducts);
    on<UpdateProductEvent>(_updateProducts);
    on<AddProductEvent>(_addToCart);
  }
  Future<void>_getCart(CartEvent event,Emitter<CartStates>emit)async{
    emit(CartLoadingStates());
    final response = await DioHelper().getData("client/cart",haveToken: true);
    if(response.isSuccess){
      final model =CartData.fromJson(response.response!.data);
      emit(CartSuccessStates(model: model));
    }else{
      showMessage(response.message);
      emit(CartFailedStates(msg: response.message));
    }
  }
  Future<void>_deleteProducts(DelProductEvent event,Emitter<CartStates> emit)async {
    emit(DeleteLoadingStates());
    final response = await DioHelper().deleteData("client/cart/delete_item/${event.model.id}",haveToken: true);

    if(response.isSuccess){
      showMessage(response.message,type: MessageType.success);
      add(CartEvent());


      emit(DeleteSuccessStates());
    }else{
      showMessage(response.message);
      emit(DeleteFailedStates());
    }

  }
  Future<void>_updateProducts(UpdateProductEvent event,Emitter<CartStates> emit)async{
    emit(UpdateLoadingStates());
    final response = await DioHelper().updateData("client/cart/${event.id}",haveToken: true,
      data: {
      "amount":event.amount
      }
    );
    if(response!.isSuccess){
      showMessage(response.message,type: MessageType.success);
      emit(UpdateSuccessStates());
    }else{
      showMessage(response.message);
      emit(UpdateFailedStates());
    }
  }
  Future<void>_addToCart(AddProductEvent event,Emitter<CartStates> emit)async{
    emit(AddToCardLoadingState());
    final response = await DioHelper().sendData("client/cart",haveToken: true,
        data: {

          "amount":event.model.count,
          "product_id":event.model.id
        }
    );
    if(response!.isSuccess){
      showMessage(response.message,type: MessageType.success);
      navigatorTo(CartView());

      emit(AddToCardSuccessState());
    }else{
      showMessage(response.message);
      emit(AddToCardFailedState());
    }
  }
}