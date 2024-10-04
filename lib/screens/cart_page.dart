import 'package:flutter/material.dart';
import 'package:plant_app/Models/plant.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:plant_app/widgets/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> myCart;
  const CartPage({
    super.key,
    required this.myCart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String productPrices() {
    int product = 0;
    for (int i = 0; i < widget.myCart.length; i++) {
      product += widget.myCart[i].price;
    }
    return product.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.myCart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'سبد خرید شما خالی است ',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            : Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.myCart.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: ProductMaker(
                                plantList: widget.myCart, index: index),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  productPrices(),
                                  style: TextStyle(
                                      color: Consts.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Text(
                              'جمع کل',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
