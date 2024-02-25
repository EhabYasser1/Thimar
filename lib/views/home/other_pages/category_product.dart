
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/categories/model.dart';
import 'package:untitled3/features/category_product/bloc.dart';
import 'package:untitled3/features/category_product/states.dart';
import 'package:untitled3/features/product/model.dart';
import 'package:untitled3/features/product_rate/model.dart';

import '../../../features/category_product/events.dart';
import '../../../features/category_product/widgets/Item_grid_category_product.dart';

class CategoryProductView extends StatefulWidget {
  final CategoryModel model;
  const CategoryProductView({super.key, required this.model});


  @override
  State<CategoryProductView> createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
  late CategoryProductBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bloc.add(CategoryProductEvent(model: widget.model));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.name),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme.of(context).primaryColor.withOpacity(.14),
            ),
            child: IconButton(
              padding: EdgeInsetsDirectional.only(
                bottom: 2,
              ),
              icon: Image.asset("assets/icon/arrowR.png"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),

      ),
      body: SafeArea(
        child:
            BlocBuilder<CategoryProductBloc,CategoryProductStates>(
              builder: (context, state) {
                if(state is CategoryProductLoadingStates){
                  return Center(child: CircularProgressIndicator());
                }else if(state is CategoryProductSuccessStates){
                  return GridView.builder(

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing: 10,childAspectRatio: 163 / 215,
                    ),
                    itemBuilder: (context, index) => ItemsGridCategoryProduct(model:state.list[index]),
                    itemCount:state.list.length ,
                  );
                }else{
                  return Text("Failed");
                }
              },
            ),

      ) ,
    );
  }
}

