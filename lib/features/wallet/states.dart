import 'model.dart';

class WalletStates {}

class GetWalletLoadingState extends WalletStates{}
class GetWalletFailedState extends WalletStates{}
class GetWalletSuccessState extends WalletStates{
   final WalletData model;

  GetWalletSuccessState({required this.model});
}