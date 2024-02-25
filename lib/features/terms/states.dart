import 'model.dart';

class TermStates{}

class TermLoadingState extends TermStates{}
class TermSuccessState extends TermStates{
  final TermModel model;

  TermSuccessState({required this.model});
}
class TermFailedState extends TermStates{}