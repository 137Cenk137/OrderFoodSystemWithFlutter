

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yemek_sistemi/data/repository/food_repo.dart';



class BasketTotalPrice extends Cubit<int> {
  BasketTotalPrice() : super(0);

  var frepo = FoodRepository();

  Future<void> getAllPrice() async {
    int totalPrice = 0;
    var list = await frepo.getAllFromBasket();
    for (var food in list) {
      totalPrice += await int.parse(food.yemek_fiyat) * int.parse(food.yemek_siparis_adet);
    }
    print(totalPrice);
    emit(totalPrice);
  }


}

