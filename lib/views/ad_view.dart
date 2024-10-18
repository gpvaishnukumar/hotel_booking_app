import 'package:flutter/material.dart';

class AdView extends StatelessWidget {
  const AdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150, // Set the same height as hotel card
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
  }
}
