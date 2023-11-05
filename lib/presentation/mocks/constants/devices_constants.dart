import 'package:iot_home_control/domain/entities/entities.dart';

final List<Device> devices = [
  Pantry(
      id: '1',
      name: 'Pantry 2.0',
      type: 'pantry',
      categoryId: '1',
      description: 'This is a pantry device',
      state: true,
      userId: '1',
      quantity: 20),
  Light(
      id: '2',
      name: 'Philips light RGB',
      type: 'light',
      categoryId: '2',
      description: 'This is a light device',
      state: true,
      userId: '1',
      brightness: 0.2),
  Curtain(
      id: '1',
      name: 'Curtain automatic 2.0',
      type: 'curtain',
      categoryId: '3',
      description: 'This is a pantry device',
      state: true,
      userId: '1',
      isOpen: true),
  Pantry(
      id: '1',
      name: 'Pantry 2.0',
      type: 'pantry',
      categoryId: '1',
      description: 'This is a pantry device',
      state: true,
      userId: '1',
      quantity: 20),
  Pantry(
      id: '1',
      name: 'Pantry 2.0',
      type: 'pantry',
      categoryId: '1',
      description: 'This is a pantry device',
      state: true,
      userId: '1',
      quantity: 10),
];
