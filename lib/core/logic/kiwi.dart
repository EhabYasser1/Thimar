import 'package:kiwi/kiwi.dart';
import 'package:untitled3/core/logic/dio_helper.dart';
import 'package:untitled3/features/addresses/bloc.dart';
import 'package:untitled3/features/fags/bloc.dart';
import 'package:untitled3/features/orders/finished_order/bloc.dart';
import 'package:untitled3/features/slider/bloc.dart';

import '../../features/categories/bloc.dart';
import '../../features/contact/bloc.dart';
import '../../features/orders/current_order/bloc.dart';
import '../../features/orders/order_details/bloc.dart';
import '../../features/product/bloc.dart';
import '../../features/terms/bloc.dart';
import '../../features/wallet/bloc.dart';

void initKiwi(){
  KiwiContainer container = KiwiContainer();
container.registerSingleton((container) => DioHelper());
container.registerFactory((container) => SlidersBloc(DioHelper()));
container.registerFactory((container) => CategoriesBloc(DioHelper()));
container.registerFactory((container) => ProductsBloc(DioHelper()));
container.registerFactory((container) => OrderDetailsBloc(DioHelper()));
container.registerFactory((container) => FinishedOrderBloc(DioHelper()));
container.registerFactory((container) => CurrentOrderBloc(DioHelper()));
container.registerFactory((container) => WalletBloc(DioHelper()));
container.registerFactory((container) => TermBloc(DioHelper()));
container.registerFactory((container) => FagsBloc(DioHelper()));
container.registerFactory((container) => ContactBloc(DioHelper()));
container.registerFactory((container) => AddressBloc(DioHelper()));
}
