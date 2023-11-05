import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mappers/mappers.dart';

class DeviceBoxPreview extends StatelessWidget {
  final DeviceViewModel device;

  const DeviceBoxPreview({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .1,
        decoration: BoxDecoration(
            color: device.color, borderRadius: BorderRadius.circular(20)),
        child: Icon(
          device.icon,
          size: 50,
        ));
  }
}
