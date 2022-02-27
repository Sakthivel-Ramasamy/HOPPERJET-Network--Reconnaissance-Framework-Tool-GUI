import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hopperjet/presenter/localsource/source.dart';
import 'package:hopperjet/view/widgets/navbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> generateImagesTiles() {
    return CarouselImages.map((e) => ClipRRect(
          child: Image.asset(
            e,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        )).toList();
  }

  late int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Appname,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 80, 0),
            child: Column(
              children: [
                const Icon(Icons.support_outlined),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: const Text(
                    support,
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomNavBar(
            Active: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 120,
            height: MediaQuery.of(context).size.height - 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  items: generateImagesTiles(),
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, _) {
                        setState(() {
                          current = index;
                        });
                      }),
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(
                    child: Text(
                      CarouselFeatures[current],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
