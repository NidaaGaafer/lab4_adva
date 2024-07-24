import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lab4_adva/widget/carsouse_indecator.dart';

class HomePage extends StatefulWidget {
  //final List<AdBanner> bannerList;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentImage = 0;
  List<String> imgList = [
    'assets/flower1.jpg',
    'assets/flower2.webp',
    'assets/flower3.webp',
    'assets/flower4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carsousel Slider'),
        backgroundColor: Color.fromARGB(255, 248, 178, 225),
      ),
      body: Container(
        color: Color.fromARGB(255, 214, 211, 211),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: CarouselSlider(
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
                      setState(() {
                        currentImage = value;
                      });
                    }),
              ),
            ),
            BuildCarsourelIndecator(
                currentImage: currentImage, imageNum: imgList.length)
          ],
        ),
      ),
    );
  }
}
