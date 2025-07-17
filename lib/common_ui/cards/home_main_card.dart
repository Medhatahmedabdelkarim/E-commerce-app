import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../constants/colors.dart';
import '../../data/models/product.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatefulWidget {
  const CardDesign({super.key});

  @override
  State<CardDesign> createState() => _ProductDetailsCardState();
}

int currentIndex = 0;


class _ProductDetailsCardState extends State<CardDesign> {
  var items=[Image.asset('assets/Images/Picture swipe.png',fit: BoxFit.cover,),Image.asset('assets/Images/Picture swipe.png',fit: BoxFit.cover,),Image.asset('assets/Images/Picture swipe.png',fit: BoxFit.cover)];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 214,
      child: Stack(
        children: [
          PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: items.length,
              itemBuilder: (context, pagePosition) {
                return items[currentIndex];
              }),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(color: Color.fromRGBO(31,32,36, 1,),activeColor:EColors.primary, ),
            ),
          ),
        ],
      ),
    );
  }
}
