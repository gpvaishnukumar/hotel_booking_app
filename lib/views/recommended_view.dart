import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import '../models/hotel_model.dart';
import '../views/hotel_detail_view.dart'; // Import the HotelDetailView

class RecommendedView extends StatelessWidget {
  final BookingController bookingController = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: screenWidth * 0.7, // Increased height to account for image + text
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookingController.hotels.length,
            itemBuilder: (context, index) {
              final hotel = bookingController.hotels[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => HotelDetailView(hotel: hotel)); // Navigate to HotelDetailView
                },
                child: Container(
                  width: screenWidth * 0.55, // Increased width to 55% of screen width
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              hotel.imageUrl,
                              height: screenWidth * 0.5, // Image height
                              width: screenWidth * 0.55, // Image width increased
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: screenWidth * 0.5,
                                  width: screenWidth * 0.55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.shade200,
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
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: IconButton(
                                icon: Obx(() => Icon(
                                  hotel.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                                  color: hotel.isFavorite.value ? Colors.red : Colors.grey,
                                  size: 16,
                                )),
                                onPressed: () {
                                  bookingController.toggleFavorite(index);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), // Add some space between image and text

                      // Hotel name and rating in a row (opposite sides)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between name and rating
                        children: [
                          Expanded( // Ensures name takes available space
                            child: Text(
                              hotel.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis, // Handle overflow
                              maxLines: 1, // Limit to 1 line
                            ),
                          ),
                          Row( // Rating display
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                hotel.rating.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4),

                      // Price per night below the name and rating
                      Text(
                        '\$${hotel.price} /night',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
