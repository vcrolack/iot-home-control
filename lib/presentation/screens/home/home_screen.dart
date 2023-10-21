import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _CustomAppBarHome(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        const Search(),
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categories',
              style: textStyle.displaySmall,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Categories()
      ],
    );
  }
}

class _CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBarHome();

  @override
  Widget build(BuildContext context) {
    const appBarHeigth = 150.0;

    return AppBar(
        toolbarHeight: appBarHeigth,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.start,
            ),
            Text(
              'Victor Rolack',
              style: TextStyle(fontSize: 40),
            )
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
