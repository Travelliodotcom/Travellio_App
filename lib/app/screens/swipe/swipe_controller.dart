// swipe_controller.dart

import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';

import '../../widgets/card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class swipeController {
  final List<SwipeItem> swipeItems = <SwipeItem>[];

  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<String> _imageUrls = [
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://images.indianexpress.com/2016/09/pisa3.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1T7noMiMob7ZM_QImqeIF2C-JtQEaJ_s-Dw&usqp=CAU",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
  ];

  final List<String> _names = [
    "Jon Snow",
    "Michael Jordan",
    "Santa Claus",
    "Your Mom",
    "Burrah Paaji",
    "Momo",
    "Modi",
    "Jai Shri Ram"
  ];

  final List<int> _age = [25, 37, 93, 22, 35, 12, 64, 35];

  void initialize() {
    for (int i = 0; i < _names.length; i++) {
      swipeItems.add(SwipeItem(
          content: CardWidget(
            imageUrl:_imageUrls[i],
            name:_names[i],
            age:_age[i]
          ),
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);
  }
}
