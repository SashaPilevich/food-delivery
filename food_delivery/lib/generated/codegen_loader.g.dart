// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "foodDelivery": "Food Delivery",
  "add": "Add",
  "home": "Home",
  "cart": "Cart",
  "orderHistory": "Order History",
  "settings": "Settings",
  "ingredients": "Ingredients",
  "cost": "Cost",
  "showMore": "Show More",
  "showLess": "Show Less"
};
static const Map<String,dynamic> pl_PL = {
  "foodDelivery": "Dostawa Żywności",
  "add": "Dodaj",
  "home": "Spis treści",
  "cart": "Koszyk",
  "orderHistory": "Historia Zamówień",
  "settings": "Ustawienia",
  "ingredients": "Składniki",
  "cost": "Koszt",
  "showMore": "Pokaż Więcej",
  "showLess": "Pokaż Mniej"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pl_PL": pl_PL};
}
