import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Coffee> _coffeeMenu = [
    // Cappuchino
    Coffee(
      name: "Cappucino",
      price: "20.000",
      imagePath: 'lib/images/latte.png',
      rating: "4.9",
      description:
          "A cappuccino is a classic coffee drink that originates from Italy. It's typically made with equal parts of espresso, steamed milk, and milk foam. The espresso provides a strong, rich coffee flavor, while the steamed milk adds a creamy texture, and the milk foam gives it a light, frothy top. Cappuccinos are often enjoyed in the morning or as a pick-me-up during the day, and they're known for their balanced and delicious taste!",
    ),

    // Latte
    Coffee(
        name: "Americano",
        price: "18.000",
        imagePath: 'lib/images/americano.png',
        rating: "4.8",
        description:
            "An Americano is a beloved coffee beverage made by diluting one or more shots of espresso with hot water. This drink is appreciated for its harmonious flavor profile, blending the bold intensity of espresso with the smoothness of hot water. The name Americano is thought to have originated from its popularity in Europe as a choice for those seeking a lighter alternative to straight espresso. Today, Americanos are enjoyed globally for their adaptability—they can be enjoyed black or personalized with milk and sweeteners according to individual preferences."),

    // Matcha
    Coffee(
      name: "Matcha Latte",
      price: "20.000",
      imagePath: 'lib/images/matcha-latte.png',
      rating: "4.9",
      description:
          "A Matcha Latte is a popular beverage made from matcha, a finely ground green tea powder from Japan. It's prepared by mixing the matcha powder with steamed milk and sometimes sweeteners like sugar syrup or honey. The drink is known for its vibrant green color and unique flavor profile, which blends herbal and sweet notes from the matcha with the creamy texture of milk. Matcha Lattes are enjoyed as a healthier and energizing alternative to traditional coffee, appealing to those who appreciate its distinctive taste and potential health benefits.",
    ),
  ];

  // Customer Cart
  List<Coffee> _cart = [];

  // Getter Methods
  List<Coffee> get coffeeMenu => _coffeeMenu;
  List<Coffee> get cart => _cart;

  // Add to cart
  void addToCart(Coffee coffeeItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(coffeeItem);
    }
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}
