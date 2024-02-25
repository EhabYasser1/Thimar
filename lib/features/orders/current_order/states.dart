import 'model.dart';

class CurrentOrderStates{}

class CurrentOrderLoadingState extends CurrentOrderStates{}
class CurrentOrderFailedState extends CurrentOrderStates{}
class CurrentOrderSuccessState extends CurrentOrderStates{
  final CurrentOrderData model;

  CurrentOrderSuccessState({ required this.model});
}