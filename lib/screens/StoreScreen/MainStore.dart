import 'util/my_tab.dart';
import 'package:flutter/material.dart';

import 'tab/burger_tab.dart';
import 'tab/donut_tab.dart';
import 'tab/pancake_tab.dart';
import 'tab/pizza_tab.dart';
import 'tab/smoothie_tab.dart';

class StorePage extends StatefulWidget {
  final String userid;
  const StorePage({super.key, required this.userid});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // my tabs
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      iconPath: 'lib/screens/StoreScreen/icons/donut.png',
    ),

    // burger tab
    MyTab(
      iconPath: 'lib/screens/StoreScreen/icons/burger.png',
    ),

    // smoothie tab
    MyTab(
      iconPath: 'lib/screens/StoreScreen/icons/smoothie.png',
    ),

    // pancake tab
    MyTab(
      iconPath: 'lib/screens/StoreScreen/icons/pancakes.png',
    ),

    // pizza tab
    MyTab(
      iconPath: 'lib/screens/StoreScreen/icons/pizza.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Column(
          children: [
            // i want to eat
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'I want to eat',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  Text(
                    ' EAT',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // tab bar
            TabBar(tabs: myTabs),

            // tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  // donut page
                  DonutTab(userid: widget.userid, foodtype: '1'),

                  // burger page
                  BurgerTab(userid: widget.userid, foodtype: '2'),

                  // smoothie page
                  SmoothieTab(),

                  // pancake page
                  PancakeTab(),

                  // pizza page
                  PizzaTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
