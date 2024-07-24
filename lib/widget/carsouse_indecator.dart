import 'package:flutter/material.dart';

class BuildCarsourelIndecator extends StatelessWidget {
  final int imageNum;
  final int currentImage;
  const BuildCarsourelIndecator(
      {super.key, required this.currentImage, required this.imageNum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imageNum; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == currentImage ? 7 : 5,
            width: i == currentImage ? 7 : 5,
            decoration: BoxDecoration(
                color: i == currentImage ? Colors.black : Colors.grey,
                shape: BoxShape.circle),
          )
      ],
    );
  }
}
