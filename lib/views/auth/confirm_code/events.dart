class ConfirmCodeEvents {}

class ConfirmCodeEvent extends ConfirmCodeEvents{
  String phone;
  ConfirmCodeEvent({required this.phone});
}
class CheckCodeEvent extends ConfirmCodeEvents{
  String phone;
  CheckCodeEvent({required this.phone});
}
