// warning: This is a test entity

abstract class Device {
  final String id;
  final String name;
  final String type;
  final String categoryId;
  final String description;
  final bool state;
  final String userId;

  Device(
      {required this.id,
      required this.name,
      required this.type,
      required this.categoryId,
      required this.description,
      required this.state,
      required this.userId});
}
