import 'model.dart';

class ProductsStates{}
class ProductsLoadingState extends ProductsStates{}
class ProductsFailedState extends ProductsStates{
  final String msg;

  ProductsFailedState({ required this.msg});
}
class ProductsSuccessState extends ProductsStates{
  List<ProductModel>list;
  ProductsSuccessState({required this.list});

}