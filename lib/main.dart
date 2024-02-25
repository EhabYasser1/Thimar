import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/cart/bloc.dart';
import 'package:untitled3/features/cart/events.dart';
import 'package:untitled3/features/categories/events.dart';
import 'package:untitled3/features/category_product/bloc.dart';
import 'package:untitled3/features/favorite/bloc.dart';
import 'package:untitled3/features/get_cities/bloc.dart';
import 'package:untitled3/features/get_cities/events.dart';
import 'package:untitled3/features/orders/current_order/bloc.dart';
import 'package:untitled3/features/orders/current_order/events.dart';
import 'package:untitled3/features/product/events.dart';
import 'package:untitled3/features/slider/events.dart';

import 'core/logic/help_navigator.dart';
import 'core/logic/kiwi.dart';

import 'features/categories/bloc.dart';
import 'features/product/bloc.dart';
import 'features/slider/bloc.dart';
import 'features/wallet/bloc.dart';
import 'features/wallet/events.dart';
import 'views/auth/confirm_code/bloc.dart';
import 'views/auth/forgot_password/bloc.dart';
import 'views/auth/login_view/bloc.dart';
import 'views/auth/register_view/bloc.dart';

import 'views/home/other_pages/details_order.dart';



import 'views/home/view.dart';
import 'views/my_account_screens/wallet.dart';





void main()  {
  WidgetsFlutterBinding.ensureInitialized();

 initKiwi();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: getMyMaterialColor(),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       // BlocProvider(create: (context) => CategoriesBloc()..add(CategoryEvent()),),
     //   BlocProvider(create: (context) => SlidersBloc()..add(SliderEvent()),),
      //  BlocProvider(create: (context) => ProductsBloc()..add(ProductEvent()),),
        BlocProvider(create: (context) => GetCitiesBloc()..add(CitiesEvent()),),
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) => RegisterBloc(),),
        BlocProvider(create: (context) => ConfirmCodeBloc(),),
        BlocProvider(create: (context) => ForgotBloc(),),
        BlocProvider(create: (context) => CartBloc()..add(CartEvent()),),
        BlocProvider(create: (context) => FavoriteBloc(),),
        BlocProvider(create: (context) => CategoryProductBloc(),),
        //BlocProvider(create: (context) => WalletBloc()..add(GetWalletEvent()),),
       // BlocProvider(create: (context) => CurrentOrderBloc()..add(CurrentOrderEvent()),),

      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
      splitScreenMode: true,

      designSize: Size(375,812),
        builder: (context, child) =>MaterialApp(

          navigatorKey: navigatorKey,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,

              appBarTheme: AppBarTheme(
                  centerTitle:true ,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:getMyMaterialColor())) ,

              filledButtonTheme: FilledButtonThemeData(
                  style: FilledButton.styleFrom(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)

                      ),
                      fixedSize: const Size.fromHeight(60)
                  )
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color:getMyMaterialColor() ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      fixedSize: const Size.fromHeight(60)

                  )
              ),
              inputDecorationTheme:InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))
              ),
              primarySwatch: getMyMaterialColor()),

          debugShowCheckedModeBanner: false,
          title: 'Flutter App',
          home: child,


        ) ,
        child: HomeView()
      ),
    );
  }
}


MaterialColor getMyMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(
      color.value,
      {
        50: color.withOpacity(.1),
        100: color.withOpacity(.2),
        200: color.withOpacity(.3),
        300: color.withOpacity(.4),
        400: color.withOpacity(.5),
        500: color.withOpacity(.6),
        600: color.withOpacity(.7),
        700: color.withOpacity(.8),
        800: color.withOpacity(.9),
        900: color.withOpacity(1),
      }
  );
}