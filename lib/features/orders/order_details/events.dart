import 'model.dart';

class OrderDetailsEvents{}

class OrderDetailsEvent extends OrderDetailsEvents{
   final int id;

  OrderDetailsEvent({required this.id});
}