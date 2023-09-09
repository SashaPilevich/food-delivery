import 'dart:convert';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  final DishModel testDishModel = DishModel(
    id: '1',
    title: 'Pizza',
    imageUrl: 'image.png',
    cost: 15,
    description: 'Some description',
    ingredients: ['ingredients 1', 'ingredients 2'],
    category: 'Italian',
  );
  test('should be a subclass of DishModel', () {
    expect(testDishModel, isA<DishModel>());
  });

  test('should return a valid model from json', () {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dish_model_data_response.json'),
    );

    final DishModel result = DishModel.fromJson(jsonMap);
    expect(result, isA<DishModel>());
  });

  test('should return a json map containing proper data', () {
    final Map<String, dynamic> result = testDishModel.toJson();
    final Map<String, Object> expectedJsonMap = {
      'id': '1',
      'title': 'Pizza',
      'imageUrl': 'image.png',
      'cost': 15,
      'description': 'Some description',
      'ingredients': ['ingredients 1', 'ingredients 2'],
      'category': 'Italian'
    };
    expect(result, expectedJsonMap);
  });
}
