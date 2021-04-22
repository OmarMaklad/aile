import 'package:flutter/material.dart';
import 'carousel_dot.dart';

class CarouselIndicator extends StatelessWidget {
  final int pageIndex;
  CarouselIndicator(this.pageIndex);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselDot(pageIndex: pageIndex, baseIndex: 0),
          CarouselDot(pageIndex: pageIndex, baseIndex: 1),
        ],
      ),
    );
  }
}