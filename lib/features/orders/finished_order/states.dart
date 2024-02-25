import 'package:untitled3/features/orders/current_order/model.dart';


class FinishedOrderStates{}

class FinishedOrderLoadingState extends FinishedOrderStates{}
class FinishedOrderFailedState extends FinishedOrderStates{}
class FinishedOrderSuccessState extends FinishedOrderStates{
  final CurrentOrderData model;

  FinishedOrderSuccessState({ required this.model});
}