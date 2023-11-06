import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/features/categories/bloc.dart';
import 'package:untitled3/features/categories/states.dart';
import 'package:untitled3/features/product/bloc.dart';
import 'package:untitled3/features/product/states.dart';
import 'package:untitled3/features/slider/bloc.dart';

import '../../../../features/categories/model.dart';
import '../../../../features/product/model.dart';
import '../../../../features/slider/states.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List<ListViewHomeModel> list= [
  //   ListViewHomeModel(image:"assets/icon/vegetable.png" , title: "الخضار", color: Color(0xffF6F9F3)),
  //   ListViewHomeModel(image:"assets/icon/fruit.png" , title: "الفواكه", color: Color(0xffFFFAEE)),
  //   ListViewHomeModel(image:"assets/icon/steak.png" , title: "اللحوم", color: Color(0xffFFF8F6)),
  //   ListViewHomeModel(image:"assets/icon/spices.png" , title: "البهارات", color: Color(0xffF6FCFE)),
  //   ListViewHomeModel(image:"assets/icon/dates.png" , title: "التمور", color: Color(0xffFDF7F5)),
  // ];
  // List<String> images = [
  //   "https://behealthis.com/f/e7/7e/e77e8765926c70da1ef50385c4c6aa8a.jpg",
  //   "https://thumbs.dreamstime.com/b/assorted-raw-organic-vegetables-isolated-white-composition-detox-diet-99751693.jpg",
  //   "https://cdn.futura-sciences.com/buildsv6/images/wide1920/e/b/b/ebb5f44e91_50191364_alimentation-nutrition.jpg"
  // ];
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: AppInput(
                labelText: "ابحث عن ماتريد؟", icon: "assets/icon/search.png"),
          ),
          BlocBuilder<SlidersBloc,SliderStates>(
            builder: (context, state) {
              if(state is SliderLoadingState){
                return Center(child: CircularProgressIndicator());
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
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(state.list.length, (index) => Padding(

                        padding: const EdgeInsetsDirectional.only(end: 3),
                        child: CircleAvatar(radius:index==currentIndex?6:4,
                          backgroundColor: index==currentIndex?Theme.of(context).primaryColor.withOpacity(.30):Color(0xff61B80C).withOpacity(.40),

                        ),
                      )),

                    ),
                  ],
                );
              }else{
                return Text("Faild");
              }

            },

          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.only(right:16 ),
                child: Text("الأقسام",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
              )),
              TextButton(onPressed: (){}, child: Text("عرض الكل",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),))
            ],
          ),
          BlocBuilder<CategoriesBloc,CategoriesStates>(
            builder: (context, state) {
              if(state is CategoriesLoadingState){
                return Center(child: CircularProgressIndicator());
              }else if (state is CategoriesSuccessState){
                 return SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal ,
                    itemCount: state.list.length,
                    itemBuilder: (context, index) =>ItemListView(model:state.list[index]) ,),
                );
              }else{
                return Text("Faild");
              }
            },


          ),
          Padding(
            padding: const EdgeInsets.only(right:16 ),
            child: Text("الاصناف",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
          ),
          BlocBuilder<ProductsBloc,ProductsStates>(
              builder: (context, state) {
                if(state is ProductsLoadingState){
                  return Center(child: CircularProgressIndicator());
                }else if (state is ProductsSuccessState){
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing: 10,childAspectRatio: 163 / 250 ),

                    itemBuilder: (context, index) => ItemsProduct(model: state.list[index]),
                    itemCount: state.list.length,
                  );

                }else{
                  return Text("Fialed");
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
      padding: EdgeInsets.all(9),
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
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    child: Text(
                      "-45%",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(11)),

                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 3,),
          Text("طماطم",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text("السعر/ 1كجم",
            style: TextStyle(color: Color(0xff808080),fontSize: 12,fontWeight: FontWeight.w400),
              ),
          SizedBox(
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
              children: [TextSpan(text: "\t"),
                TextSpan(text:"56 ر.س" ,style:
              TextStyle(
                decoration: TextDecoration.lineThrough,
                  fontSize: 13,fontWeight: FontWeight.bold))]
            )
          ),
          SizedBox(height: 16,),
          SizedBox(
            height: 35,
            child: AppButton(text: "اضف للسلة",
              onPressed: () {

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

        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Image.asset(
              "assets/image/logo.png",
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
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
                    children: [
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
              label: Text(
                "3",
                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                width: 33,
                height: 33,
                padding: EdgeInsets.all(7),
                child: SvgPicture.asset(
                  "assets/icon/svg/cart.svg",
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadius.circular(9)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(60);
}

class ItemListView extends StatelessWidget {
  final CategoryModel model;

  const ItemListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 75,
            child: Image.network(model.media,height: 37,width: 37,fit: BoxFit.scaleDown),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),


          ),
        ),
        Text(model.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
      ],
    );
  }
}

