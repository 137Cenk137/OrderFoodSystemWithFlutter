import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/repository/food_repo.dart';
import 'package:yemek_sistemi/ui/cubit/abstract.dart';

import '../../data/entity/yemekler.dart';

class MainPageCubit extends Cubit<List<Food>> implements MainPageCubitInterface{
  MainPageCubit():super(<Food>[]);

  var frepo = FoodRepository();
  @override
  void getAllFood() async {
    // TODO: implement getAllFood
    var foodsList = await frepo.getAllFood();
    emit(foodsList);

  }

  @override
  void getSearchWithName(String name) {
    // TODO: implement getSearchWithName
    throw UnimplementedError();
  }



}