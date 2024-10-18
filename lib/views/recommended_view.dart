import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import '../models/hotel_model.dart';
import '../views/hotel_detail_view.dart'; // Import the HotelDetailView

class RecommendedView extends StatelessWidget {
  final BookingController bookingController = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
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
          height: 200, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookingController.hotels.length,
            itemBuilder: (context, index) {
              final hotel = bookingController.hotels[index];
              return GestureDetector( // Wrap with GestureDetector
                onTap: () {
                  Get.to(() => HotelDetailView(hotel: hotel)); // Navigate to HotelDetailView
                },
                child: Container(
                  width: 180, // Adjust width as needed
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          hotel.imageUrl,
                          height: 200,
                          width: 180,
                          fit: BoxFit.cover,
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
