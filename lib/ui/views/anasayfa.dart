import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_sistemi/ui/views/main_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

var tfSearch = TextEditingController();
int secilenIndex = 0;
var sayfalar = [const MainPage2(),const MainPage2(),const MainPage2(),const MainPage2()];


@override
  void initState() {
    context.read<MainPageCubit>().getAllFood();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Merhaba"),
        actions: [
          SizedBox(width:200, child: TextField(controller: tfSearch,decoration: InputDecoration(hintText: "ara"),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: sayfalar[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house),label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favori"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: "hesap"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: "Sepet")
        ],

        currentIndex: secilenIndex,
        onTap: (index){
          setState(() {
            secilenIndex = index;
          });
        },

      ),
    );
  }
}
