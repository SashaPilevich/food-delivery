// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en_US = {
    "homePage": {
      "foodDelivery": "Food Delivery",
      "home": "Home",
      "cart": "Cart",
      "orderHistory": "Order History",
      "settings": "Settings"
    },
    "homeScreen": {
      "add": "Add",
      "dishAddedToTheCart": "The dish has been added to the cart!",
      "noInternet":
          "No internet connection. All data will be taken from the cache.",
      "hasInternet": "Internet connection is available.",
      "hello": "Hello",
      "chooseDishes": "Choose dishes and enjoy"
    },
    "selectDishScreen": {
      "ingredients": "Ingredients",
      "cost": "Cost",
      "showMore": "Show More",
      "showLess": "Show Less",
      "descriptionNotAvailable": "Description Not Available",
      "addToCart": "Add to cart",
      "addedToCart": "Added to cart"
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Your shopping cart is empty",
      "chooseDishes": "Choose dishes",
      "totalPrice": "Total Price",
      "makeAnOrder": "Make An Order",
      "acceptedOrder": "Your order is accepted",
      "thankYou": "Thank you!",
      "takeMoreFood": "Take more food"
    },
    "settingsScreen": {
      "useSystemTheme": "Use system theme",
      "useCustomTheme": "Use custom theme:",
      "changeFontSize": "Change font size",
      "selectLanguage": "Select language:",
      "contactUs": "Contact us"
    },
    "authScreens": {
      "email": "Email",
      "password": "Password",
      "userName": "User name",
      "emailIsRequired": "Email is required",
      "userNameIsRequired": "User name is required",
      "invalidEmailFormat": "Invalid email format",
      "invalidUserName": "The user name must be at least 3 characters long",
      "invalidPassword": "The password must be at least 6 characters long",
      "forgotPassword": "Forgot password?",
      "signIn": "Sign In",
      "signUp": "Sign Up",
      "or": "Or",
      "signInWithGoogle": "Sign In with Google",
      "dontHaveAccount": "Don't have an account?",
      "haveAccount": "Already have an account?",
      "resetPassword": "Reset password",
      "checkEmail": "New password has been pass. Check your email."
    },
    "orderHistoryScreen": {"orderHistoryEmpty": "Your order history is empty"}
  };
  static const Map<String, dynamic> pl_PL = {
    "homePage": {
      "foodDelivery": "Dostawa Żywności",
      "home": "Spis treści",
      "cart": "Koszyk",
      "orderHistory": "Historia Zamówień",
      "settings": "Ustawienia"
    },
    "homeScreen": {
      "add": "Dodaj",
      "dishAddedToTheCart": "Danie zostało dodane do koszyka!",
      "noInternet":
          "Brak połączenia z Internetem. Wszystkie dane zostaną pobrane z pamięci podręcznej.",
      "hasInternet": "Dostępne jest połączenie z Internetem.",
      "hello": "Witam",
      "chooseDishes": "Wybierz dania i ciesz się"
    },
    "selectDishScreen": {
      "ingredients": "Składniki",
      "cost": "Koszt",
      "showMore": "Pokaż Więcej",
      "showLess": "Pokaż Mniej",
      "descriptionNotAvailable": "Opis Niedostępny",
      "addToCart": "Dodaj do koszyka",
      "addedToCart": "Dodano do koszyka"
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Twój koszyk jest pusty",
      "chooseDishes": "Wybierz dania",
      "totalPrice": "Cena Całkowita",
      "makeAnOrder": "Złóż zamówienie",
      "acceptedOrder": "Twoje zamówienie jest akceptowane",
      "thankYou": "Dziękuję!",
      "takeMoreFood": "Weź więcej jedzenia"
    },
    "settingsScreen": {
      "useSystemTheme": "Użyj motywu systemowego",
      "useCustomTheme": "Użyj niestandardowego motywu:",
      "changeFontSize": "Zmień rozmiar czcionki",
      "selectLanguage": "Wybierz język:",
      "contactUs": "Skontaktuj się z nami"
    },
    "authScreens": {
      "email": "Email",
      "password": "Hasło",
      "userName": "Nazwa użytkownika",
      "emailIsRequired": "E-mail jest wymagany",
      "userNameIsRequired": "Nazwa użytkownika jest wymagana",
      "invalidEmailFormat": "Nieprawidłowy format wiadomości e-mail",
      "invalidUserName": "Nazwa użytkownika musi mieć co najmniej 3 znaki",
      "invalidPassword": "Hasło musi mieć co najmniej 6 znaków",
      "forgotPassword": "Zapomniałem hasła?",
      "signIn": "Zaloguj się",
      "signUp": "Zarejestruj się",
      "or": "Or",
      "signInWithGoogle": "Zaloguj się przez Google",
      "dontHaveAccount": "Nie masz konta?",
      "haveAccount": "Masz już konto?",
      "resetPassword": "Resetuj hasło",
      "checkEmail": "Nowe hasło zostało przekazane. Sprawdź swoją pocztę."
    },
    "orderHistoryScreen": {
      "orderHistoryEmpty": "Twoja historia zamówień jest pusta"
    }
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en_US": en_US,
    "pl_PL": pl_PL
  };
}
