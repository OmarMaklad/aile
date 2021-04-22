import 'package:flutter/material.dart';

import '../../../constants.dart';

class CarouselDot extends StatelessWidget {
  final int pageIndex;
  final int baseIndex;
  CarouselDot({@required this.pageIndex, @required this.baseIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:5,
      ),
      child: CircleAvatar(
        radius: 5,
        backgroundColor:
       pageIndex == baseIndex ? Colors.white:kTextColor,

      ),
    );
  }
}
