import '../../models/cities.dart';

class GetCitiesStates{}
class GetCitiesLoadingStates extends GetCitiesStates{}
class GetCitiesSuccessStates extends GetCitiesStates{

  List<CityModel>list;
  GetCitiesSuccessStates({required this.list});
}
class GetCitiesFailedStates extends GetCitiesStates{}