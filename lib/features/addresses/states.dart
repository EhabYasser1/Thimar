import 'package:untitled3/features/addresses/model.dart';

class AddressStates {}
class GetAddressLoadingState extends AddressStates{}
class GetAddressSuccessState extends AddressStates{
 final List<AddressModel> list;

  GetAddressSuccessState({required this.list});
}
class GetAddressFailedState extends AddressStates{}

class AddAddressLoadingState extends AddressStates{}
class AddAddressFailedState extends AddressStates{}
class AddAddressSuccessState extends AddressStates{}


class DeleteAddressLoadingState extends AddressStates{}
class DeleteAddressFailedState extends AddressStates{}
class DeleteAddressSuccessState extends AddressStates{}