import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_auth101/screens/StoreScreen/tab/tabdata.dart/donut_tab_data.dart';
import 'package:firebase_auth101/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../util/donut_tile.dart';

class BurgerTab extends StatefulWidget {
  final String userid;
  final String foodtype;

  const BurgerTab({super.key, required this.userid, required this.foodtype});

  @override
  State<BurgerTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<BurgerTab> {
  // List _donutsOnSale = [];

  // List _donutsOnSale = [
  //   {"flavor": "a", "price": "30", "color": "d"},
  // ];

  Future<List<DonutsOnSale>> getFoods() async {
    var url = Uri.parse('http://10.0.2.2/flutter/blogapp/showProducts.php');
    print(widget.foodtype);
    final response = await http.post(url, body: {"foodtype": widget.foodtype});
    List data = jsonDecode(response.body);

    List<DonutsOnSale> _donutsOnSale = data
        .map((_donutsOnSale) => DonutsOnSale.fromJson(_donutsOnSale))
        .toList();

    return (_donutsOnSale);
  }

  // List _donutsOnSale = [
  //   {
  //     "flavor": "Ice Cream",
  //     "price": "36",
  //     "color": Colors.blue,
  //     "imageName": "lib/screens/StoreScreen/images/icecream_donut.png"
  //   },
  //   {
  //     "flavor": "Banana",
  //     "price": "36",
  //     "color": Colors.red,
  //     "imageName": "lib/screens/StoreScreen/images/icecream_donut.png"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<DonutsOnSale>>(
      future: getFoods(),
      builder: (context, data) {
        if (data.hasData) {
          List<DonutsOnSale> _donutsOnSale = data.data!;
          return GridView.builder(
            itemCount: _donutsOnSale.length,
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              return DonutTile(
                userid: widget.userid,
                foodid: (_donutsOnSale[index].id!),
                donutFlavor: _donutsOnSale[index].flavor!,
                donutPrice: _donutsOnSale[index].price!,
                donutColor: Colors.blue,
                imageName: "lib/screens/StoreScreen/images/burger.png",
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
