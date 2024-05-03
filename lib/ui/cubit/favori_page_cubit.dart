

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/data/repository/food_favorite_repo.dart';

class FavoriFoodCubit extends Cubit<List<Food>>{
  FavoriFoodCubit():super(<Food>[]);

  var frepo = FoodFavoriteRepository();
  Future<void> addFavori (String yemek_id,String yemek_adi,String sepet_resim_adi,String yemek_fiyat) async{

      await frepo.addFavori(yemek_id,yemek_adi, sepet_resim_adi, yemek_fiyat);

  }

  Future<void> deleteFavorite(String sepet_yemek_id)async{
    await frepo.deleteFavori(sepet_yemek_id);

  }

  Future<void> getAllFavorite() async{
    var list = await frepo.getAllFavorite();
    emit(list);
  }

}