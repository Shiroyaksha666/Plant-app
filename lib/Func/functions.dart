import 'package:flutter/material.dart';
import 'package:plant_app/statics/consts.dart';

// Extracted widget page creator for splash screens
class PageCreator extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PageCreator({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45, left: 45),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 140,
          ),
          SizedBox(
            height: 340,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 30,
                color: Consts.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            textAlign: TextAlign.center,
            description,
            style: const TextStyle(
                fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

// func for like button
bool toggleIsFavorited(bool isFavorited) {
  return !isFavorited;
}

// Extracted widget for detail page
class PlantFeatures extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeatures({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Consts.blackColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          plantFeature,
          style: TextStyle(
            fontSize: 23,
            color: Consts.primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 22,
        )
      ],
    );
  }
}
