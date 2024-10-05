import 'package:flutter/material.dart';
import 'package:plant_app/statics/consts.dart';
import 'package:plant_app/widgets/profileoptions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Consts.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'مهسا مرادی',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/verified.png'),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'mahsamoradi@gmail.com',
              style: TextStyle(
                  fontSize: 18, color: Consts.blackColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 30,
            ),
            const ProfileOptions(title: 'پروفایل من', icon: Icons.person),
            const ProfileOptions(icon: Icons.settings, title: 'تنظیمات'),
            const ProfileOptions(
                icon: Icons.notifications, title: 'اطلاع رسانی ها'),
            const ProfileOptions(icon: Icons.share, title: 'شبکه های اجتماعی'),
            const ProfileOptions(icon: Icons.logout, title: 'خروج'),
          ],
        ),
      ),
    );
  }
}
