import 'package:flutter/material.dart';
import 'package:plant_app/Models/plant.dart';
import 'package:plant_app/widgets/plant.dart';

class FavouritePage extends StatefulWidget {
  final List<Plant> favoritedPlant;
  const FavouritePage({
    super.key,
    required this.favoritedPlant,
  });

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoritedPlant.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'ظاهرا به هیچی علاقه نداری :|',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            : Container(
                height: size.height * 0.5,
                width: size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.favoritedPlant.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: ProductMaker(
                          plantList: widget.favoritedPlant, index: index),
                    );
                  },
                ),
              ));
  }
}
