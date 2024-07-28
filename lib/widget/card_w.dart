import 'package:flutter/material.dart';

class CardWatch extends StatelessWidget {
  String imag;
  String name;
  int price;

  CardWatch(
      {super.key, required this.imag, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/$imag',
            height: 200,
            width: 200,
          ),
          SizedBox(width: 30),
          Column(
            children: [Text(name), Text(price.toString())],
          )
        ],
      ),
    ));
  }
}
