import 'package:flutter/material.dart';
import 'package:plant_app/Func/functions.dart';
import 'package:plant_app/screens/unchangable.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controll = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 19 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Consts.primaryColor,
      ),
    );
  }

  List<Widget> indicatorBuilder() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 22,
              right: 22,
            ),
            child: InkWell(
              child: const Text('رد کردن'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const UnchangablePage(),
                        type: PageTransitionType.fade));
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controll,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              PageCreator(
                image: 'assets/images/plant-one.png',
                title: Consts.titleOne,
                description: Consts.descriptionOne,
              ),
              PageCreator(
                image: 'assets/images/plant-two.png',
                title: Consts.titleTwo,
                description: Consts.descriptionTwo,
              ),
              PageCreator(
                image: 'assets/images/plant-three.png',
                title: Consts.titleThree,
                description: Consts.descriptionThree,
              )
            ],
          ),
          Positioned(
            bottom: 85,
            left: 30,
            child: Row(
              children: indicatorBuilder(),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Consts.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _controll.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      }
                    } else {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const UnchangablePage(),
                              type: PageTransitionType.rightToLeft));
                    }
                  });
                },
                icon: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
