import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_sistemi/ui/views/detail_page.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({super.key});

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [

            BlocBuilder<MainPageCubit,List<Food>>(builder:
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




                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(onPressed: (){

                                }, icon:Icon(Icons.favorite_border_sharp,size: 28,) ),
                                Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}"),
                                Center(child: Text("${food.yemek_adi}",style: TextStyle(fontSize: 20),)),
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
