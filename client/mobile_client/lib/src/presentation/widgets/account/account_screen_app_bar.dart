import 'package:flutter/material.dart';
import '/src/utils/constants/constants.dart';

class AccuntScreenAppBar extends StatelessWidget {
  const AccuntScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: Constants.appBarGradient),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45,
            width: 120,
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/images/amazon_in_altt.png'),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
