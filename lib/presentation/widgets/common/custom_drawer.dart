import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/config/menu/menu_items.dart';

final navDrawerIndexProvider = StateProvider<int>((ref) => 0);

class CustomDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    final navDrawerIndex = ref.watch(navDrawerIndexProvider);

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        ref.watch(navDrawerIndexProvider.notifier).state = value;
        final menuItem = appMenuItems[value];
        if (menuItem.onTap != null) {
          menuItem.onTap!(context, ref);
        } else {
          context.push(menuItem.link!);
        }

        scaffoldKey.currentState?.closeDrawer();
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
            .sublist(0, 4)
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
            .sublist(4, appMenuItems.length)
            .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                )),
      ],
    );
  }
}
