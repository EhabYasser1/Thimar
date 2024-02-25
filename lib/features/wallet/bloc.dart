import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/wallet/events.dart';
import 'package:untitled3/features/wallet/states.dart';

import '../../core/logic/dio_helper.dart';
import 'model.dart';

class WalletBloc extends Bloc<WalletEvents,WalletStates>{
  final DioHelper dioHelper;
  WalletBloc(this.dioHelper):super(WalletStates()){
    on<GetWalletEvent>(_getData);
  }
Future<void>_getData(GetWalletEvent event,Emitter<WalletStates>emit)async {

    emit(GetWalletLoadingState());
    final response = await dioHelper.getData("wallet");
    if(response.isSuccess){
      final model =WalletData.fromJson(response.response!.data);
      emit(GetWalletSuccessState(model: model));
    }else{
      emit(GetWalletFailedState());
    }
}


}
