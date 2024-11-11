import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/hotel_model.dart';
import 'hotel_detail_view.dart'; // Import the HotelDetailView

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  final Function onToggleFavorite;

  const HotelCard({Key? key, required this.hotel, required this.onToggleFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Get.to(() => HotelDetailView(hotel: hotel)); // Navigate to HotelDetailView
      },
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    child: Image.network(
                      hotel.imageUrl,
                      width: screenWidth * 0.9, // Set width to 90% of screen width
                      height: screenWidth * 0.5, // Set height to 50% of width for aspect ratio
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: screenWidth * 0.9, // Match width
                          height: screenWidth * 0.5, // Match height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Icon(Icons.broken_image, size: 50),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white, // Transparent background
                      radius: 22, // Increased radius for a larger circle
                      child: IconButton(
                        icon: Obx(() => Icon(
                          Icons.favorite, // Always use the filled heart icon
                          color: hotel.isFavorite.value
                              ? Colors.red // Red if it's favorited
                              : Colors.grey, // Grey if not favorited
                          size: 25, // Increased icon size
                        )),
                        onPressed: () => onToggleFavorite(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${hotel.price} ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '/night⚡',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              hotel.rating.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      hotel.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 2),
                    // Replaced location with "Private room / 4 beds"
                    Text(
                      'Private room / 4 beds',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
