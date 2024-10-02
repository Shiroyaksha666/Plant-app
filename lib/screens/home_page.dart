import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Func/functions.dart';
import 'package:plant_app/Models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:plant_app/widgets/extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  final List<Plant> _plantList = Plant.plantList;
  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل کار |',
    '| گل باغچه ای |',
    '| گل سمی |',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Consts.blackColor.withOpacity(0.15),
                  ),
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.mic,
                        color: Consts.blackColor.withOpacity(0.6),
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'جستجو...',
                                contentPadding:
                                    EdgeInsets.only(right: 5, left: 5)),
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.start,
                            showCursor: false,
                          ),
                        ),
                      ),
                      Icon(Icons.search,
                          color: Consts.blackColor.withOpacity(0.6)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              height: 70,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: selectedindex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedindex == index
                                ? Consts.primaryColor
                                : Consts.blackColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                reverse: true,
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: _plantList[index].plantId,
                              ),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      width: 220,
                      decoration: BoxDecoration(
                        color: Consts.primaryColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorited(
                                        _plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 20,
                                  color: Consts.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 50,
                            left: 50,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                    color: Consts.primaryColor, fontSize: 16),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
                bottom: 15,
              ),
              child: Text(
                'گیاهان جدید',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Consts.blackColor,
                    fontSize: 26),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: _plantList[index].plantId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Consts.primaryColor.withOpacity(0.1),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 80,
                      width: size.width,
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                                child: Image.asset(
                                    'assets/images/PriceUnit-green.png'),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                _plantList[index].price.toString().farsiNumber,
                                style: TextStyle(
                                    color: Consts.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Consts.primaryColor.withOpacity(0.8)),
                              ),
                              Positioned(
                                right: 0,
                                left: 0,
                                bottom: 5,
                                child: SizedBox(
                                  height: 70,
                                  child:
                                      Image.asset(_plantList[index].imageURL),
                                ),
                              ),
                              Positioned(
                                right: 80,
                                bottom: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      _plantList[index].category,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Consts.blackColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _plantList[index].plantName,
                                      style: TextStyle(
                                          color: Consts.blackColor
                                              .withOpacity(0.6),
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
