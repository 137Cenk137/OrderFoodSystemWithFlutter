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

  Future<void> deleteFromBasket(String sepet_yemek_id)async{
    await frepo.deleteFromBasket(sepet_yemek_id);

  }
  Future<void> totalPrice() async{
    int totalprice = 0;
    var list = await frepo.getAllFromBasket();
    for (var food in list) {
       totalprice += int.parse(food.yemek_fiyat) * int.parse(food.yemek_siparis_adet);
    }

  }

}