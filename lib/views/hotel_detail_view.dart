import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class HotelDetailView extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailView({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                hotel.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Hotel details
            Text(
              hotel.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              hotel.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              '\$${hotel.price} /night',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
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
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
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
