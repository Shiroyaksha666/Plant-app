import 'package:flutter/material.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favourite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';
import 'package:plant_app/screens/scan_page.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';

class UnchangablePage extends StatefulWidget {
  const UnchangablePage({super.key});

  @override
  State<UnchangablePage> createState() => _UnchangablePageState();
}

class _UnchangablePageState extends State<UnchangablePage> {
  int iconIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];

  List<IconData> iconlist = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appbarTittle = [
    'خانه',
    'علاقه مندی ها',
    'سبد خرید',
    'پروفایل',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.black54,
                ),
                Text(
                  appbarTittle[iconIndex],
                  style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: iconIndex,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const ScanPage(),
                    type: PageTransitionType.bottomToTop));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Consts.primaryColor,
          child: Image.asset(
            'assets/images/code-scan-two.png',
            height: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          height: 65,
          splashColor: Consts.primaryColor,
          activeColor: Consts.primaryColor,
          activeIndex: iconIndex,
          icons: iconlist,
          inactiveColor: Colors.black.withOpacity(0.6),
          notchSmoothness: NotchSmoothness.softEdge,
          gapLocation: GapLocation.center,
          onTap: (int value) {
            setState(() {
              iconIndex = value;
            });
          },
        ));
  }
}
