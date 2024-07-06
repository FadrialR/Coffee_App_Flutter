import 'package:coffee_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            // Shop Name
            Text(
              "COFFUN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 0),

            // Icon
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset('lib/images/coffee-beans1.png'),
            ),

            const SizedBox(height: 0),

            // Title
            Text(
              "Coffee so good, Your taste buds will love it",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 34,
              ),
            ),

            const SizedBox(height: 18),

            // Subtitle
            Text(
              "Find the best coffee for you",
              style: TextStyle(color: Colors.grey[700], height: 0.2),
            ),

            const SizedBox(height: 18),

            // Button
            MyButton(
              text: "Get Started",
              onTap: () {
                // Go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
