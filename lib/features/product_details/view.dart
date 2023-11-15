import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/core/logic/help_navigator.dart';
import 'package:untitled3/features/cart/bloc.dart';
import 'package:untitled3/features/cart/events.dart';

import '../../core/design/app_button.dart';
import '../cart/view.dart';
import '../product/bloc.dart';
import '../product/events.dart';
import '../product/model.dart';
import '../product/states.dart';
import '../product_rate/view.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel model;

  const ProductDetailsView({super.key, required this.model});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(model: widget.model),
      body: Builder(builder: (context) {
        ProductsBloc bloc = BlocProvider.of(context);
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.12),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40))),
                    width: 405,
                    height: 322,
                    child: widget.model.images.isEmpty
                        ? Image.network(
                            widget.model.mainImage,
                            fit: BoxFit.fill,
                          )
                        : CarouselSlider(
                            items: List.generate(
                                widget.model.images.length,
                                (index) => Image.network(
                                      widget.model.images[index].url,
                                      height: 164,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    )),
                            options: CarouselOptions(
                              height: 164,
                              autoPlay: true,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                currentIndex = index;
                                setState(() {});
                              },
                            ),
                          ),
                  ),
                  /*    Positioned(
                      bottom: 10,left: 164,right: 164,
                      child: Row(
                        children: List.generate(5, (index) => const Padding(

                          padding: EdgeInsetsDirectional.only(end: 3),
                          child: CircleAvatar(radius:4,
                              backgroundColor: Colors.green
                            //Theme.of(context).primaryColor.withOpacity(.30)
                          ),
                        )),
                      ),
                   ),
                    */
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 22),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color:
                                Theme.of(context).primaryColor.withOpacity(.14),
                          ),
                          child: IconButton(
                            padding: EdgeInsetsDirectional.only(
                              bottom: 2,
                            ),
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Spacer(),
                        BlocBuilder<ProductsBloc, ProductsStates>(
                          builder: (context, state) => Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.14),
                            ),
                            child: IconButton(
                              padding: EdgeInsetsDirectional.only(bottom: 2),
                              icon:widget.model.isFavorite? Icon(Icons.favorite_border,
                                  color: Theme.of(context).primaryColor
                                      ):Icon(Icons.favorite_border) ,
                              onPressed: () {
                                bloc.add(FavoritesAddEvent(model: widget.model));

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "السعر/ 1كجم",
                        style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 19,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text.rich(TextSpan(
                          text: "${widget.model.price} ر.س",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(text: "\t"),
                            TextSpan(
                                text: "${widget.model.priceBeforeDiscount} ر.س",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))
                          ])),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 109,
                        height: 35,
                        decoration: BoxDecoration(
                            color: const Color(0xff707070).withOpacity(.11),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  color: Colors.white,
                                  height: 29,
                                  width: 29,
                                  child: IconButton(
                                      padding: const EdgeInsetsDirectional.only(
                                          bottom: 3),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        if(widget.model.count<widget.model.amount) {
                                          widget.model.count++;
                                          widget.model.totalPrice(widget.model.count);

                                        }
                                        setState(() {

                                        });
                                      },
                                      icon: const Icon(Icons.add))),
                               Text("${widget.model.count}"),
                              Container(
                                  color: Colors.white,
                                  height: 29,
                                  width: 29,
                                  child: IconButton(
                                      padding: const EdgeInsetsDirectional.only(
                                          bottom: 3),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        if(widget.model.count>1) {
                                          widget.model.count--;
                                          widget.model.totalPrice(widget.model.count);

                                        }
                                        setState(() {

                                        });
                                      },
                                      icon: const Icon(Icons.remove))),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    "كود المنتج",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    widget.model.code,
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff707070)),
                  )
                ],
              ),
              const Divider(),
              Text(
                "تفاصيل المنتج",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.model.description,
                style: const TextStyle(fontSize: 14, color: Color(0xff757575)),
              ),
              const SizedBox(
                height: 14,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "التقييمات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {}, child: const Text("عرض الكل"))
                    ],
                  ),
                  ReviewScreen(
                    id: widget.model.id,
                  )
                ],
              ),
              Text(
                "منتجات مشابهة",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              BlocBuilder<ProductsBloc, ProductsStates>(
                  builder: (context, state) {
                if (state is ProductsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsSuccessState) {
                  return SizedBox(
                    height: 250,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            widget.model.id == state.list[index].id
                                ? SizedBox()
                                : SizedBox(
                                    height: 170,
                                    width: 130,
                                    child: ListProductSame(
                                      model: state.list[index],
                                    )),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: state.list.length),
                  );
                } else {
                  return const Text("Fialed");
                }
              }),

            ],
          ),
        );
      }),
    );
  }
}

class ListProductSame extends StatelessWidget {
  final ProductModel model;

  const ListProductSame({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
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
                  Image.network(model.mainImage,
                      width: 115, height: 200, fit: BoxFit.fill),
                  Container(
                    width: 40,
                    height: 17,
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(11)),
                    ),
                    child: const Text(
                      "-45%",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "طماطم",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "السعر/ 1كجم",
            style: TextStyle(
                color: Color(0xff808080),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 3,
          ),
          Text.rich(TextSpan(
              text: "45 ر.س",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: const [
                TextSpan(text: "\t"),
                TextSpan(
                    text: "56 ر.س",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13,
                        fontWeight: FontWeight.bold))
              ])),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 35,
            child: AppButton(
              text: "اضف للسلة",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final ProductModel model;
  const BottomBar({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final bloc= BlocProvider.of<CartBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) =>  InkWell(
        onTap: () {
          bloc.add(AddProductEvent(model: model));

        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 14.h,horizontal: 32.w),
            child: Row(
              children: [
                Container(
                  height: 32.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: Color(0xff6AA431),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset("assets/icon/Shopping.png",fit: BoxFit.scaleDown,color: Colors.white),
                ),
                SizedBox(width: 10.w,),
                Text("إضافة إلي السلة",style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Spacer(),
                Text("ر.س${model.totalPrice(model.count)}",style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
