import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/data/repository/food_favorite_repo.dart';
import 'package:yemek_sistemi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/detail_page_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/favori_page_cubit.dart';
import 'package:yemek_sistemi/ui/views/detail_page.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({super.key});

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {

  bool isSearch = false;

  var tfSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title:  const Text("Merhaba"),

        actions: [
          isSearch ? SizedBox(width:200, child: TextField(controller: tfSearch,decoration: InputDecoration(hintText: "ara"),)):
          Text(" "),
          isSearch ? IconButton(onPressed: (){setState(() {
            isSearch = false;
          });}, icon: Icon(Icons.remove)):IconButton(onPressed: (){
            setState(() {
              isSearch = true;
            });
          }, icon: Icon(Icons.search))
        ],
      ),
      backgroundColor:Colors.orange[100] ,
      body: Center(
        child: Column(
          children: [

            BlocBuilder<MainPageCubit,List<Food>>(
                builder:
                (context,foodList) {
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DeatilPage(food: food))).then((v) {
                              context.read<MainPageCubit>().getAllFood();
                            });
                          },
                          child: Card(
                            color: Colors.grey[200],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(onPressed: (){
                                  context.read<FavoriFoodCubit>().addFavori(food.yemek_id, food.yemek_adi, food.yemek_resim_adi, food.yemek_fiyat);
                                },icon: const Icon(Icons.favorite_border_sharp,size: 28,) ),
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
