import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/categories/bloc.dart';
import 'package:untitled3/features/categories/states.dart';
import 'package:untitled3/features/category_product/event.dart';
import 'package:untitled3/features/category_product/states.dart';
import 'package:untitled3/features/product/bloc.dart';
import 'package:untitled3/features/product/states.dart';
import 'package:untitled3/features/slider/bloc.dart';

import '../../../../features/categories/model.dart';
import '../../../../features/category_product/bloc.dart';
import '../../../../features/category_product/view.dart';
import '../../../../features/product/model.dart';
import '../../../../features/product_details/view.dart';
import '../../../../features/slider/states.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppInput(
                labelText: "ابحث عن ماتريد؟", icon: "assets/icon/search.png"),
          ),
          BlocBuilder<SlidersBloc,SliderStates>(
            builder: (context, state) {
              if(state is SliderLoadingState){
                return const Center(child: CircularProgressIndicator());
              }else if (state is SliderSuccessState){
                return Column(
                  children: [
                    CarouselSlider(
                      items: List.generate(
                          state.list.length,
                              (index) => Image.network(
                            state.list[index].media ,
                            height: 164,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          )),
                      options: CarouselOptions(
                        height: 164,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          currentIndex=index;
                          setState(() {

                          });
                        },

                      ),
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(state.list.length, (index) => Padding(

                        padding: const EdgeInsetsDirectional.only(end: 3),
                        child: CircleAvatar(radius:index==currentIndex?6:4,
                          backgroundColor: index==currentIndex?Theme.of(context).primaryColor.withOpacity(.30):const Color(0xff61B80C).withOpacity(.40),

                        ),
                      )),

                    ),
                  ],
                );
              }else{
                return const Text("Faild");
              }

            },

          ),
          const SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(right:16 ),
            child: Text("الأقسام",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
          ),

          BlocBuilder<CategoriesBloc,CategoriesStates>(
            builder: (context, state) {
              if(state is CategoriesLoadingState){
                return const Center(child: CircularProgressIndicator());
              }else if (state is CategoriesSuccessState){
                 return Padding(
                   padding: const EdgeInsets.only(right: 16),
                   child: SizedBox(
                    height: 110,
                    child: ListView.separated(

                      separatorBuilder: (context, index) => SizedBox(width: 18),
                      scrollDirection:Axis.horizontal ,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) =>ItemListView(model:state.list[index]) ,),
                ),
                 );
              }else{
                return const Text("Faild");
              }
            },


          ),
          const Padding(
            padding: EdgeInsets.only(right:16 ),
            child: Text("الاصناف",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
          ),
          BlocBuilder<ProductsBloc,ProductsStates>(
            buildWhen:  (previous, current) => current is ProductsLoadingState || current is ProductsSuccessState,
              builder: (context, state) {
                if(state is ProductsFailedState){
                  return  Text("Fialed $state");

                }else if (state is ProductsSuccessState){
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing: 10,childAspectRatio: 163 / 250 ),

                    itemBuilder: (context, index) => ItemsProduct(model: state.list[index]),
                    itemCount: state.list.length,
                  );

                }else{
                  return const Center(child: CircularProgressIndicator());

                }

              },)


        ],


      ),
    );
  }
}

class ItemsProduct extends StatelessWidget {
 final ProductModel model;
  const ItemsProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.network(model.mainImage),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadiusDirectional.only(bottomStart: Radius.circular(11)),

                    ),
                    child: const Text(
                      "-45%",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 3,),
          Text("طماطم",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text("السعر/ 1كجم",
            style: TextStyle(color: Color(0xff808080),fontSize: 12,fontWeight: FontWeight.w400),
              ),
          const SizedBox(
            height: 3,
          ),
          Text.rich(
            TextSpan(
              text: "45 ر.س",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: const [TextSpan(text: "\t"),
                TextSpan(text:"56 ر.س" ,style:
              TextStyle(
                decoration: TextDecoration.lineThrough,
                  fontSize: 13,fontWeight: FontWeight.bold))]
            )
          ),
          const SizedBox(height: 16,),
          SizedBox(
            height: 35,
            child: AppButton(text: "اضف للسلة",
              onPressed: () {
              navigatorTo(ProductDetailsView(model: model,));

              },
            ),
          )

        ],
      ),
    );
  }
}




























class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Image.asset(
              "assets/image/logo.png",
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: "التوصيل إلى",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor),
                    children: const [
                      TextSpan(text: "\n"),
                      TextSpan(
                          text: "شارع الملك فهد - جدة",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ]),
              ),
            ),
            Badge(
              alignment: AlignmentDirectional.topStart,
              label: const Text(
                "3",
                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                width: 33,
                height: 33,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadius.circular(9)),
                child: SvgPicture.asset(
                  "assets/icon/svg/cart.svg",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class ItemListView extends StatelessWidget {
  final CategoryModel model;

  const ItemListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded ( child: 
            GestureDetector(
              child: Container(
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(model.media,height: 37,width: 37,fit: BoxFit.scaleDown),


              ),
              onTap: () {
                navigatorTo(CategoryProductView(model: model,));

              },
            ),
        ),
        Text(model.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
      ],
    );
  }
}

