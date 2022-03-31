import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CardItem extends StatelessWidget {
  Text globalText;
  String title;
  CardItem({Key? key, required this.globalText, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VerticalDivider(
          indent: 20,
          endIndent: 20,
          thickness: 2,
          color: kPrimaryColor,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            globalText,
          ],
        ),
      ],
    );
  }
}
