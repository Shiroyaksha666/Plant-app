import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:plant_app/widgets/extension.dart';

class ProductMaker extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;
  const ProductMaker({
    super.key,
    required List<Plant> plantList,
    required this.index,
  }) : _plantList = plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: Image.asset('assets/images/PriceUnit-green.png'),
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
                      color: Consts.primaryColor.withOpacity(0.8)),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 5,
                  child: SizedBox(
                    height: 70,
                    child: Image.asset(_plantList[index].imageURL),
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
                            color: Consts.blackColor.withOpacity(0.6),
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
  }
}
