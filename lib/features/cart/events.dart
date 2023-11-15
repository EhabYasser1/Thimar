import 'package:untitled3/features/cart/model.dart';
import 'package:untitled3/features/product/model.dart';

class CartEvents{}

class CartEvent extends CartEvents{}
class DelProductEvent extends CartEvents{
  final CartModel model;

  DelProductEvent({required this.model});
}
class AddProductEvent extends CartEvents{
  final ProductModel model;

  AddProductEvent({required this.model});
}
class UpdateProductEvent extends CartEvents{
  final int id,amount;

  UpdateProductEvent({ required this.amount, required this.id});
}