import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function()? onPressed;

  CustomAppBar({
    Key? key,
    this.onPressed,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        onPressed: widget.onPressed,
        icon: const Icon(Icons.refresh),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
    );
  }
}
