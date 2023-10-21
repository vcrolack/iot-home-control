import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/device.dart';
import 'package:iot_home_control/presentation/mocks/constants/devices_constants.dart';
import 'package:iot_home_control/presentation/mocks/mappers/icon_mapper.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.75,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colors.onInverseSurface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: devices.length + 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Devices',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    } else if (index == 1) {
                      return IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 50,
                          color: colors.primary,
                        ),
                      );
                    } else if (index - 2 < devices.length) {
                      final device =
                          devices[index - 2]; // -2 para ajustar el índice
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            _DeviceItem(device: device, textStyle: textStyle),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            ),
          ]),
        );
      },
    );
  }
}

class _DeviceItem extends StatelessWidget {
  const _DeviceItem({
    required this.device,
    required this.textStyle,
  });

  final Device device;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
                color: Color(int.parse(device.color)),
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              iconMapping[device.iconIdentifier],
              size: 50,
            )),
        const SizedBox(
          width: 10,
        ),
        Text(
          device.name,
          style: textStyle.titleMedium,
        ),
        const Spacer(),
        FilledButton(onPressed: () {}, child: const Text('See more'))
      ],
    );
  }
}
