import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemek_sepet.dart';
import 'package:yemek_sistemi/ui/cubit/basket_page_cubit.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    context.read<BasketPageCubit>().getAllBasket();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<BasketPageCubit,List<FoodBasket>>(
          builder: (context,foodBasketlist){
            if(foodBasketlist.isNotEmpty){
              return ListView.builder(
                itemCount: foodBasketlist.length,
                  itemBuilder: (context,index){
                    var food = foodBasketlist[index];
                    return Card(
                      child:Row(
                        children: [
                          Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.sepet_resim_adi}"),
                          Column(
                            children: [
                              Text("${food.yemek_adi}"),
                              Text("fiyat : ${food.yemek_fiyat}"),
                              Text("adet : ${food.yemek_siparis_adet}")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              Text("fiyat : ${food.yemek_fiyat}"),
                            ],
                          ),

                        ],
                      ) ,
                    );
                  }
              );
            }
            else{
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
