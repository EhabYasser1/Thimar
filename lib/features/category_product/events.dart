import 'package:untitled3/features/categories/model.dart';

import 'model.dart';

class CategoryProductEvents{}
class CategoryProductEvent extends CategoryProductEvents{
  final CategoryModel model;

  CategoryProductEvent({required this.model});
}