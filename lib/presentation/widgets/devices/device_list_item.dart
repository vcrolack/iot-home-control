import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class DeviceItem extends StatelessWidget {
  const DeviceItem({
    super.key,
    required this.device,
    required this.textStyle,
  });

  final Device device;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    final maxLength = 15;

    return Row(
      children: [
        DeviceBoxPreview(device: device),
        const SizedBox(
          width: 10,
        ),
        Text(
          device.name.length > maxLength
              ? '${device.name.substring(0, maxLength)}...'
              : device.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: textStyle.titleMedium,
        ),
        const Spacer(),
        FilledButton(onPressed: () {}, child: const Text('See more'))
      ],
    );
  }
}
