import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class HotelDetailView extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailView({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                hotel.imageUrl,
                width: double.infinity,
                height: screenWidth * 0.5, // Adaptive height (50% of screen width)
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: screenWidth * 0.5, // Same adaptive height as above
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
            ),
            SizedBox(height: screenWidth * 0.04), // Space below image (4% of screen width)
            // Hotel details
            Text(
              hotel.name,
              style: TextStyle(
                fontSize: screenWidth * 0.06, // Adaptive font size (6% of screen width)
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // Space below hotel name (2% of screen width)
            Text(
              hotel.description,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Adaptive font size (4% of screen width)
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: screenWidth * 0.04), // Space below description (4% of screen width)
            // Price and Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${hotel.price} /night',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Adaptive font size (5% of screen width)
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: screenWidth * 0.05, // Adaptive size for star icon
                    ),
                    SizedBox(width: 4),
                    Text(
                      hotel.rating.toString(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Adaptive font size for rating
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04), // Space below price and rating (4% of screen width)
            // Elevated Button at the bottom
            Spacer(), // This will push the button to the bottom
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Define your button action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04), // Adaptive padding (4% of screen width)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Box shape
                  ),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
