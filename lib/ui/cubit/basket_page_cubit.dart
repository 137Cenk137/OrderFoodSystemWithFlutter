import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemek_sepet.dart';
import 'package:yemek_sistemi/data/repository/food_repo.dart';

class BasketPageCubit extends Cubit<List<FoodBasket>>{
  BasketPageCubit():super(<FoodBasket>[]);

  var frepo = FoodRepository();
  Future<void> getAllBasket() async{
    var list = await frepo.getAllFromBasket();
    emit(list);
  }

}