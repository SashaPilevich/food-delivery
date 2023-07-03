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
  "homePage": {
    "foodDelivery": "Food Delivery",
    "home": "Home",
    "cart": "Cart",
    "orderHistory": "Order History",
    "settings": "Settings"
  },
  "homeScreen": {
    "add": "Add"
  },
  "selectDishScreen": {
    "ingredients": "Ingredients",
    "cost": "Cost",
    "showMore": "Show More",
    "showLess": "Show Less",
    "descriptionNotAvailable": "Description Not Available"
  },
  "cartScreen": {
    "yourShoppingCartIsEmpty": "Your shopping cart is empty",
    "chooseDishes": "Choose dishes",
    "totalPrice": "Total Price",
    "makeAnOrder": "Make An Order"
  }
};
static const Map<String,dynamic> pl_PL = {
  "homePage": {
    "foodDelivery": "Dostawa Żywności",
    "home": "Spis treści",
    "cart": "Koszyk",
    "orderHistory": "Historia Zamówień",
    "settings": "Ustawienia"
  },
  "homeScreen": {
    "add": "Dodaj"
  },
  "selectDishScreen": {
    "ingredients": "Składniki",
    "cost": "Koszt",
    "showMore": "Pokaż Więcej",
    "showLess": "Pokaż Mniej",
    "descriptionNotAvailable": "Opis Niedostępny"
  },
  "cartScreen": {
    "yourShoppingCartIsEmpty": "Twój koszyk jest pusty",
    "chooseDishes": "Wybierz dania",
    "totalPrice": "Cena Całkowita",
    "makeAnOrder": "Złóż zamówienie"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pl_PL": pl_PL};
}
