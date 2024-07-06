import 'package:coffee_app/components/button.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/shop.dart';
import 'package:coffee_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove from cart
  void removeFromCart(Coffee coffee, BuildContext context) {
    // Get access to the shop
    final shop = context.read<Shop>();

    // Remove from the cart
    shop.removeFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                title: const Text("My Cart"),
                elevation: 0,
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  // Customer Cart

                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // Get food from cart
                          final Coffee coffee = value.cart[index];

                          // Get food name
                          final String coffeeName = coffee.name;

                          // Get food price
                          final String coffeePrice = coffee.price;

                          // Return list tile
                          return Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: ListTile(
                              title: Text(
                                coffeeName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                coffeePrice,
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey[300],
                                ),
                                onPressed: () =>
                                    removeFromCart(coffee, context),
                              ),
                            ),
                          );
                        }),
                  ),

                  // Pay Button
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButton(text: "Pay Now", onTap: () {}),
                  )
                ],
              ),
            ));
  }
}
