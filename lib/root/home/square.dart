import 'dart:math';

import 'package:flutter/material.dart';

class Square extends StatelessWidget {

  final Color color;
  final double width;
  final double height;

  const Square(this.color,{super.key, this.width = 100, this.height = 100});

  @override
  Widget build(BuildContext context) {



    final double maximum = max(height,width);
    final double radius = maximum / 10.0;

    return Container(
      width: this.width,
      height: this.height,

      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}