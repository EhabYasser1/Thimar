import 'model.dart';

class ProductRateStates{}

class RateLoadingStates extends ProductRateStates{}
class RateSuccessStates extends ProductRateStates{
  List<DataRateModel>list;
  RateSuccessStates({required this.list});
}
class RateFailedStates extends ProductRateStates{
  String msg;
  RateFailedStates({required this.msg});
}
