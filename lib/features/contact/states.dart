import 'model.dart';

class ContactStates {}

class ContactLoadingState extends ContactStates {}
class ContactSuccessState extends ContactStates {
  final ContactModel model;

  ContactSuccessState({required this.model});
}
class ContactFailedState extends ContactStates {}

class ContactSendLoadingState extends ContactStates{}
class ContactSendSuccessState extends ContactStates{}
class ContactSendFailedState extends ContactStates{}