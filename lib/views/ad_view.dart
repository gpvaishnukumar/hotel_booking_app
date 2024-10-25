import 'package:flutter/material.dart';

class AdView extends StatelessWidget {
  const AdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the screen width
        double screenWidth = constraints.maxWidth;

        // Calculate height based on screen width (for example, 20% of the width)
        double adHeight = screenWidth * 0.4; // 40% of the width for height

        return Container(
          width: screenWidth, // Full width of the available space
          height: adHeight, // Adaptive height
          color: Colors.blueGrey, // Set a background color for the ad
          child: Center(
            child: Text(
              'This is an Ad Space',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
