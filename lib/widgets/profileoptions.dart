import 'package:flutter/material.dart';
import 'package:plant_app/statics/consts.dart';

class ProfileOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileOptions({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Consts.blackColor.withOpacity(0.4),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Consts.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                icon,
                color: Consts.blackColor.withOpacity(0.5),
                size: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
