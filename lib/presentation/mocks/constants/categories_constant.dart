import 'package:iot_home_control/domain/entities/entities.dart';

final List<Category> categories = [
  Category(
    id: '1',
    name: 'pantries',
    label: 'Check your food',
    description:
        'This category corresponds to list of devices that monitoring your pantries.',
  ),
  Category(
    id: '2',
    name: 'lights',
    label: 'Manage your lights',
    description: 'This category corresponds to the management of your lights',
  ),
  Category(
    id: '3',
    name: 'curtains',
    label: 'Open or close your curtains',
    description:
        'This category corresponds to the open or closure of your curtains',
  ),
];
