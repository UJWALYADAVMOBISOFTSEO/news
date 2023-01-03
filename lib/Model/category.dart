class Category {
  static List<Item> categories = [];
}

class Item {
  final String name;
  final String icon;

  Item({required this.name, required this.icon});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map["name"],
      icon: map["icon"]
    );
  }

  toMap() => {
        "name": name,
        "icon": icon,
      };
}
