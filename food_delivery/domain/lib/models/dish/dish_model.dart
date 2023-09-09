class DishModel {
  final String id;
  final String title;
  final String imageUrl;
  final int cost;
  final String? description;
  final List<String>? ingredients;
  final String? category;

  DishModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cost,
    this.description,
    this.ingredients,
    this.category,
  });

  List<Object?> get props =>
      [id, title, imageUrl, cost, description, ingredients, category];

  DishModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    int? cost,
    String? description,
    List<String>? ingredients,
    String? category,
  }) {
    return DishModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      category: category ?? this.category,
    );
  }

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

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      cost: json['cost'] ?? 0,
      description: json['description'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      category: json['category'] ?? '',
    );
  }

  DishModel.empty()
      : id = '',
        title = '',
        imageUrl = '',
        cost = 0,
        category = '',
        description = '',
        ingredients = [];
}
