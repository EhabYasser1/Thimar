import 'model.dart';

class CartStates {}

class CartLoadingStates extends CartStates {}
class CartSuccessStates extends CartStates {
  final CartData model;

  CartSuccessStates({required this.model});
}
class CartFailedStates extends CartStates {
  final String msg;

  CartFailedStates({required this.msg});
}
//  Delete States
class DeleteLoadingStates extends CartStates {}
class DeleteSuccessStates extends CartStates {}
class DeleteFailedStates extends CartStates {}

// Update  States
class UpdateLoadingStates extends CartStates {}
class UpdateSuccessStates extends CartStates {}
class UpdateFailedStates extends CartStates {}

class AddToCardSuccessState extends CartStates{}
class AddToCardLoadingState extends CartStates{}
class AddToCardFailedState extends CartStates{}