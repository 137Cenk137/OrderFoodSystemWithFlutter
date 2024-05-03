import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemek_sepet.dart';
import 'package:yemek_sistemi/ui/cubit/basket_page_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/basket_total.dart';

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
    context.read<BasketTotalPrice>().getAllPrice();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<BasketPageCubit,List<FoodBasket>>(
                builder: (context,foodBasketlist){
                  if(foodBasketlist.isNotEmpty){

                    return ListView.builder(
                        itemCount: foodBasketlist.length,
                        itemBuilder: (context,index){
                          var food = foodBasketlist[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 4.0,top: 4.0),
                            child: Card(
                              color: Colors.white70,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 100,width: 100,child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.sepet_resim_adi}")),
                                  Column(
                                    children: [
                                      Text("${food.yemek_adi}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      Text("fiyat : ${food.yemek_fiyat}"),
                                      Text("adet : ${food.yemek_siparis_adet}")
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: (){
                                        //delete
                                        context.read<BasketPageCubit>().deleteFromBasket(food.sepet_yemek_id).then((value) {
                                          context.read<BasketPageCubit>().getAllBasket();
                                        });
                                      }, icon: Icon(Icons.restore_from_trash)),
                                      Text("₺ ${int.parse(food.yemek_fiyat) * int.parse(food.yemek_siparis_adet)} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    ],
                                  ),
              
                                ],
                              ) ,
                            ),
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
            Center(
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gönderim Ücreti",style: TextStyle(color: Colors.black),),
                        Text("0")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Toplam"),
                        BlocBuilder<BasketTotalPrice,int>(
                          builder: (context, state) {
                            return Text("$state");
                          },
                        ),
                      ],
                    ),
                    
                   Padding(
                     padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                     child: Row(
                       children: [
                         Expanded(
                             child: ElevatedButton(onPressed: (){}, child: Text("Sepeti Onayla")))
                       ],
                     ),
                   )
                  ],
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
