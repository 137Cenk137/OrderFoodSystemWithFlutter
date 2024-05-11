import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/ui/cubit/detail_page_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/favori_page_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    context.read<FavoriFoodCubit>().getAllFavorite();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocBuilder<FavoriFoodCubit,List<Food>>(
                builder:(context,foodList) {
                  if(foodList.isNotEmpty){
                    return Expanded(
                      child: GridView.builder(
                          itemCount: foodList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                              crossAxisCount: 2,childAspectRatio: 1 / 2
                          ), itemBuilder: (context,index){
                        var food = foodList[index];
                        return
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onLongPress: (){

                              },
                              child: Card(
                                color: Colors.grey[200],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(onPressed: (){
                                      context.read<FavoriFoodCubit>().deleteFavorite(food.yemek_id).then((value) =>
                                      {
                                        context.read<FavoriFoodCubit>().getAllFavorite(),
                                      });
                                    },icon: const Icon(Icons.favorite,size: 28,) ),
                                    Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}"),
                                    Center(child: Text("${food.yemek_adi}",style: const TextStyle(fontSize: 20),)),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.motorcycle),
                                        Text("ücretsiz gönderim")
                                      ],),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("${food.yemek_fiyat} "),
                                          ElevatedButton(onPressed: (){
                                            //sepete Ekleme
                                            context.read<DetailPageCubit>().addBasket(food.yemek_adi, food.yemek_resim_adi, food.yemek_fiyat, "Cenk", "1");
                                          }, child: Icon(Icons.add)
                                            ,style: ButtonStyle(
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                                            ),)
                                        ],),
                                    )

                                  ],
                                ),

                              ),
                            ),
                          );
                      }),
                    );
                  }
                  else{
                    return Center(
                      child: Text("yk"),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
