import 'model.dart';

class FagsStates {}

class FagsLoadingState extends FagsStates{}
class FagsSuccessState extends FagsStates{
  final List <FagsModel> list;

  FagsSuccessState({required this.list});
}
class FagsFailedState extends FagsStates{}