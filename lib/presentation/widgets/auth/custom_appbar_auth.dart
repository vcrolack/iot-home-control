import 'package:flutter/material.dart';

class CustomAppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final bool automaticallyImplyLeading;
  final List<Color> colorsGradient;

  const CustomAppBarAuth(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.automaticallyImplyLeading,
      required this.colorsGradient})
      : assert(colorsGradient.length == 2, 'The proporty must have 2 colors');

  @override
  Widget build(BuildContext context) {
    const appBarHeigth = 200.0;

    return AppBar(
      toolbarHeight: appBarHeigth,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.red,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          Text(subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [colorsGradient[0], colorsGradient[1]],
          stops: const [0.25, 0.75],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
