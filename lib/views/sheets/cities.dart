import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/get_cities/states.dart';
import 'package:untitled3/models/cities.dart';

import '../../features/get_cities/bloc.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  @override



  Widget build(BuildContext context) {

        return Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "اختار مدينتك",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<GetCitiesBloc,GetCitiesStates>(
              //bloc:bloc ,
              builder: (context, state) {

              if(state is GetCitiesLoadingStates){
                return Expanded(child: Center(child: CircularProgressIndicator()));
              } else if (state is GetCitiesSuccessStates){
               return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => ItemCity(
                      model: state.list[index],
                    ),
                  ),
                );
              }else{
                return Text("Faild");
              }
            },)

          ],
        );


  }
}

class ItemCity extends StatelessWidget {
  final CityModel model;

  const ItemCity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor.withOpacity(.1)),
        child: Center(child: Text(model.name)),
      ),
    );
  }
}
//Builder(
//
//       builder: (context) {
//         GetCitiesBloc bloc = BlocProvider.of(context);
//         bloc.getData();