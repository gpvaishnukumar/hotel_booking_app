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
          height: screenWidth * 0.5, // Set height to 50% of screen width for better aspect ratio
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
                  width: screenWidth * 0.4, // Set width to 40% of screen width
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          hotel.imageUrl,
                          height: screenWidth * 0.5, // Match height
                          width: screenWidth * 0.4, // Match width
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
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
                      Positioned(
                        bottom: 16, // Adjust spacing from the bottom
                        left: 8,
                        right: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${hotel.price} /night',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
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
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
