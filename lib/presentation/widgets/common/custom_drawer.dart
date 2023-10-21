import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/config/menu/menu_items.dart';

class CustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({super.key, required this.scaffoldKey});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        if (menuItem.onTap != null) {
          menuItem.onTap!(context);
        } else {
          context.push(menuItem.link!);
        }

        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Column(
          children: [
            Icon(
              Icons.cloud_outlined,
              size: 100,
              color: colors.primary,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'IoT Home Control',
              style: textStyle.displaySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main menu'),
        ),
        ...appMenuItems
            .sublist(0, 3)
            .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                )),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),
        ...appMenuItems
            .sublist(3, appMenuItems.length)
            .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                )),
      ],
    );
  }
}
