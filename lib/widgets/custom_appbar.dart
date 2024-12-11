import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, required this.icon, this.onPressed,
  });
  final void Function()? onPressed;

    final IconData icon;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        title,
          style: TextStyle(fontSize: 28),
        ),
        CustomSearchIcon(
          onPressed: onPressed,
          icon: icon,),
      ],
    );
  }
}
