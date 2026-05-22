class Category {
  final String id;
  final String name;
  final String icon;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  // Convierte JSON a objeto — como JsonSerializer en C#
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '',
    );
  }

  // Convierte objeto a JSON — para POST/PUT
  Map<String, dynamic> toJson() {
    return {'name': name, 'icon': icon, 'color': color};
  }
}
