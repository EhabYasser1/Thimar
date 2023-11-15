import 'package:untitled3/features/product/model.dart';

class CategoryProductData {

  late final List<ProductModel> list;

  CategoryProductData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>ProductModel.fromJson(e)).toList();

  }


}



