import 'model.dart';

class ProductEvents {}

class ProductEvent extends ProductEvents{}

class FavoritesAddEvent extends ProductEvents{
  final ProductModel model;

  FavoritesAddEvent({ required this.model});

}
