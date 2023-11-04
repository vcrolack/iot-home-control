import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mocks/constants/devices_constants.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

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
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      );
                    } else if (index == 1) {
                      return IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_box_rounded,
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
                            DeviceItem(device: device, textStyle: textStyle),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
            ),
          ]),
        );
      },
    );
  }
}
