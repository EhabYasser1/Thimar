import 'model.dart';

class OrderDetailsStates{}

class OrderDetailsLoadingState extends OrderDetailsStates{}
class OrderDetailsFailedState extends OrderDetailsStates{}
class OrderDetailsSuccessState extends OrderDetailsStates{
  final OrderDetailsData model;

  OrderDetailsSuccessState({required this.model});
}