import 'model.dart';

class GetFavoritesStates{}

class GetFavoriteLoadingStates extends GetFavoritesStates{}

class GetFavoriteSuccessStates extends GetFavoritesStates{
 final List<FavoriteModel>list;

  GetFavoriteSuccessStates({required this.list});
}

class GetFavoriteFailedStates extends GetFavoritesStates{
 final String msg;

  GetFavoriteFailedStates({required this.msg});
}


