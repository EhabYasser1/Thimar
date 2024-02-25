
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

import '../../../features/favorite/bloc.dart';
import '../../../features/favorite/events.dart';
import '../../../features/favorite/model.dart';
import '../../../features/favorite/states.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context);
  }
  @override
  Widget build(BuildContext context) {
    bloc.add(GetFavoriteEvent());
    return  Scaffold(
      appBar: AppBar(
        title: Text("المفضلة",),
      ),
      body:BlocBuilder<FavoriteBloc,GetFavoritesStates>(
        builder: (context, state) {
          if(state is GetFavoriteLoadingStates){
            return Center(child: CircularProgressIndicator());
          }else if(state is GetFavoriteSuccessStates){
            return GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing: 10,childAspectRatio: 163 / 250,
              ),
              itemBuilder: (context, index) => ItemsGridFavorite(model:state.list[index]),
              itemCount:state.list.length ,
             );
          }else{
            return Text("Failed");
          }
        },
      ) ,


    );
  }
}




class ItemsGridFavorite extends StatelessWidget {
  final FavoriteModel model;
  const ItemsGridFavorite({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.network(model.mainImage),
                  Container(
                    padding:  EdgeInsets.symmetric(
                      vertical: 3.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:  BorderRadiusDirectional.only(bottomStart: Radius.circular(11.r)),

                    ),
                    child:  Text(
                      "${model.discount}%",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
           SizedBox(height: 3.h,),
          Text(model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
           SizedBox(
            height: 3.h,
          ),
           Text("السعر/ 1كجم",
            style: TextStyle(color: Color(0xff808080),fontSize: 12.sp,fontWeight: FontWeight.w400),
          ),
           SizedBox(
            height: 3.h,
          ),
          Text.rich(
              TextSpan(
                  text: "${model.priceBeforeDiscount} ر.س",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children:  [TextSpan(text: "\t"),
                    TextSpan(text:"${model.price} ر.س" ,style:
                    TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13.sp,fontWeight: FontWeight.bold))]
              )
          ),



        ],
      ),
    );
  }
}
