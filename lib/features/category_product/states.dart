import 'package:untitled3/features/product/model.dart';

import 'model.dart';

class CategoryProductStates{}

class CategoryProductLoadingStates extends CategoryProductStates{}

class CategoryProductSuccessStates extends CategoryProductStates{
  final List<ProductModel>list;

  CategoryProductSuccessStates({ required this.list});


}

class CategoryProductFailedStates extends CategoryProductStates{
  final String msg;

  CategoryProductFailedStates({required this.msg});


}