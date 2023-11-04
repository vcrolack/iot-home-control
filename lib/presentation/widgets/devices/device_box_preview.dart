import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/presentation/mocks/mappers/icon_mapper.dart';

class DeviceBoxPreview extends StatelessWidget {
  final Device device;

  const DeviceBoxPreview({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .1,
        decoration: BoxDecoration(
            color: Color(int.parse(device.color)),
            borderRadius: BorderRadius.circular(20)),
        child: Icon(
          iconMapping[device.iconIdentifier],
          size: 50,
        ));
  }
}
