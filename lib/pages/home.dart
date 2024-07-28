import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lab4_adva/widget/card_w.dart';
import 'package:lab4_adva/widget/carsouse_indecator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController? carouselController = CarouselController();
  var currentImageNotifier = ValueNotifier(0);
  int currentImage = 0;
  List<String> imgList = [
    'assets/wa3.jpg',
    'assets/wa1.jpg',
    'assets/wa2.webp',
    'assets/wa4.jpg',
  ];

  List<Watches> watches = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    setState(() {});
    try {
      var result = await rootBundle.loadString('assets/data.json');
      var response = jsonDecode(result);
      if (response['success']) {
        watches = List<Watches>.from(
            response['data'].map((e) => Watches.fromjson(e)).toList());
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\' Watches'),
        backgroundColor: Color.fromARGB(255, 248, 178, 225),
      ),
      body: Container(
        color: Color.fromARGB(255, 214, 211, 211),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: ValueListenableBuilder(
                valueListenable: currentImageNotifier,
                builder: (context, valueB, _) {
                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: carouselController,
                        items: imgList
                            .map((e) => Container(
                                  child: Center(
                                    child: Image.asset(e),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            initialPage: 0,
                            autoPlayInterval: Duration(seconds: 2),
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: (value, _) {
                              currentImageNotifier.value = value;
                              currentImage = currentImageNotifier.value;
                              // setState(() {});
                            }),
                      ),
                      DotsIndicator(
                        onTap: (index) {
                          carouselController?.animateToPage(index);
                        },
                        dotsCount: imgList.length,
                        position: currentImage,
                      ),
                    ],
                  );
                },
              ),
            ),

            /*
            BuildCarsourelIndecator(
                currentImage: currentImage, imageNum: imgList.length),
                */
            SizedBox(height: 10),
            Expanded(
              child: ListView(children: [
                for (var watchesInf in watches)
                  CardWatch(
                    imag: watchesInf.image,
                    name: watchesInf.name,
                    price: watchesInf.price,
                  ),
              ] /*
                    watches
                        .map((e) => ListTile(
                              title: Text(e.name),
                            ))
                        .toList(), */
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class Watches {
  late int id;
  late String name;
  late String image;
  late int price;
  Watches.fromjson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
    price = data['price'];
  }
}
