import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Func/functions.dart';
import 'package:plant_app/Models/plant.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:plant_app/widgets/extension.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleSelected(bool isselected) {
    return !isselected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    List<Plant> cart = Plant.addedToCartPlants();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 70,
            right: 22,
            left: 22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // x button
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Consts.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Consts.primaryColor,
                    ),
                  ),
                ),
                // like button
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Consts.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Consts.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            right: 0,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 30,
                    child: Column(
                      children: [
                        PlantFeatures(
                          title: 'اندازه گیاه',
                          plantFeature: plantList[widget.plantId].size,
                        ),
                        PlantFeatures(
                          plantFeature: plantList[widget.plantId]
                              .humidity
                              .toString()
                              .farsiNumber,
                          title: 'رطوبت هوا',
                        ),
                        PlantFeatures(
                          plantFeature:
                              plantList[widget.plantId].temperature.farsiNumber,
                          title: 'دمای نگهداری',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 10,
            child: SizedBox(
              height: 360,
              child: Image.asset(plantList[widget.plantId].imageURL),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
              width: size.width,
              height: size.height * 0.48,
              decoration: BoxDecoration(
                color: Consts.primaryColor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    plantList[widget.plantId].plantName,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Consts.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Consts.primaryColor,
                        size: 35,
                      ),
                      Text(
                        plantList[widget.plantId].rating.toString().farsiNumber,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Consts.primaryColor),
                      ),
                      const SizedBox(
                        width: 238,
                      ),
                      SizedBox(
                        height: 25,
                        child: Image.asset('assets/images/PriceUnit-green.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        plantList[widget.plantId].price.toString().farsiNumber,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Consts.blackColor.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    plantList[widget.plantId].decription,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 22,
                        height: 1.5,
                        color: Consts.blackColor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: size.width * 0.9,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: CartPage(myCart: cart),
                        type: PageTransitionType.bottomToTop));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Consts.primaryColor.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1.1),
                          color: Consts.primaryColor.withOpacity(0.3),
                          blurRadius: 5)
                    ]),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    plantList[widget.plantId].isSelected =
                        toggleSelected(plantList[widget.plantId].isSelected);
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1.1),
                          color: Consts.primaryColor.withOpacity(0.3),
                          blurRadius: 5)
                    ],
                    color: Consts.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'افزودن به سبد خرید',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold), //im here
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
