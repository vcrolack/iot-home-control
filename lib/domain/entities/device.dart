// warning: This is a test entity

class Device {
  final String id;
  final String name;
  final String type;
  final String categoryId;
  final String description;
  final bool state;
  final String userId;
  final String iconIdentifier;
  final String color;

  Device(
      {required this.id,
      required this.name,
      required this.type,
      required this.categoryId,
      required this.description,
      required this.state,
      required this.userId,
      required this.iconIdentifier,
      required this.color});
}
