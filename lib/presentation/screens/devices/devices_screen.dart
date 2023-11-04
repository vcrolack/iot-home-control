import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mocks/constants/devices_constants.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class DevicesScreen extends StatelessWidget {
  static const name = 'devices-screen';

  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Devices'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: colors.primary,
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DevicesListPreview(),
            const SizedBox(
              height: 200,
            ),
            Text(
              'Favorites',
              style: textStyles.displaySmall,
            ),
            const _FavoritesList()
            // .
          ],
        ),
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  const _FavoritesList();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
        height: 350,
        child: Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: ((context, index) {
                  // todo: create conditional to only shows favorites devices
                  final device = devices[index];
                  return SizedBox(
                      height: 110,
                      child: DeviceItem(device: device, textStyle: textStyles));
                }))));
  }
}

class _DevicesListPreview extends StatelessWidget {
  const _DevicesListPreview();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 130, // Altura fija para el ListView.builder
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2, // Asume que tienes una lista llamada devices
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Column(
                      children: [
                        DeviceBoxPreview(device: devices[index]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(devices[index].name)
                      ],
                    ));
              },
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            icon: const Icon(
              Icons.more_horiz,
              size: 50,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
