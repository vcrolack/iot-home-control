import 'package:iot_home_control/domain/entities/entities.dart';

final List<Category> categories = [
  Category(
      id: '1',
      name: 'Pantries',
      label: 'Check your food',
      description:
          'This category corresponds to list of devices that monitoring your pantries.',
      color: '0xffB34949',
      iconIdentifier: 'kitchen_outlined'),
  Category(
      id: '2',
      name: 'Lights',
      label: 'Manage your lights',
      description: 'This category corresponds to the management of your lights',
      color: '0xff459FB3',
      iconIdentifier: 'light_outlined'),
  Category(
      id: '3',
      name: 'Curtains',
      label: 'Open or close your curtains',
      description:
          'This category corresponds to the open or closure of your curtains',
      color: '0xffBDAB4A',
      iconIdentifier: 'curtains_outlined'),
];
