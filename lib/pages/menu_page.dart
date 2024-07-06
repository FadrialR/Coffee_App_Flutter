import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/shop.dart';
import 'package:coffee_app/pages/coffee_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/components/button.dart';
import 'package:coffee_app/theme/colors.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Navigate to Coffee item detials page
  void navigateToCoffeeDetails(int index) {
    // Get the shop and it's menu
    final shop = context.read<Shop>();
    final coffeeMenu = shop.coffeeMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoffeeDetailsPage(
          coffee: coffeeMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the shop and it's menu
    final shop = context.read<Shop>();
    final coffeeMenu = shop.coffeeMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Coffee',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          // Cart Button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promo Banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Promo Message
                    Text(
                      'Get 34% Promo',
                      style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    // Redeem Button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),

                // Image
                Image.asset(
                  'lib/images/latte-art.png',
                  height: 110,
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..",
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Coffee Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeMenu.length,
              itemBuilder: (context, index) => CoffeeTile(
                coffee: coffeeMenu[index],
                onTap: () => navigateToCoffeeDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Popular Menu
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/latte2.png',
                      height: 60,
                    ),

                    const SizedBox(
                      width: 20,
                    ),

                    // Name and Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Latte",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        Text(
                          '\Rp20.000',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                // Heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
