import 'package:core/core.dart';

class DishEntity {
  final String id;
  final String title;
  final String imageUrl;
  final int cost;
  final String? description;
  final List<String>? ingredients;
  final String? category;

  DishEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cost,
    this.description,
    this.ingredients,
    this.category,
  });

  List<Object?> get props => [
        id,
        title,
        imageUrl,
        cost,
        description,
        ingredients,
        category,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'cost': cost,
      'description': description,
      'ingredients': ingredients,
      'category': category,
    };
  }

  factory DishEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return DishEntity(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      cost: json['cost'] ?? 0,
      description: json['description'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      category: json['category'] ?? '',
    );
  }

  factory DishEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return DishEntity.fromJson(data);
  }
}
