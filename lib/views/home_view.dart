import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import '../controllers/location_controller.dart';
import 'hotel_card.dart';
import 'recommended_view.dart'; // Import the RecommendedView
import 'ad_view.dart'; // Import the AdView
import 'search_view.dart'; // Import the SearchView
import 'location_view.dart'; // Import the LocationView

class HomeView extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (bookingController.hotels.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Use the SearchView instead of the previous container
                  SearchView(), // Add the SearchView here
                  SizedBox(height: 16),

                  // Use the LocationView for popular locations
                  LocationView(), // Add the LocationView here

                  SizedBox(height: 16),
                  // Recommended Section (from recommended_view.dart)
                  RecommendedView(), // Add the RecommendedView here

                  // Ad Container
                  SizedBox(height: 16),
                  AdView(), // Use the AdView here

                  // Most Viewed Section
                  SizedBox(height: 16),
                  Text(
                    'Most Viewed',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bookingController.hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = bookingController.hotels[index];
                      return HotelCard(
                        hotel: hotel,
                        onToggleFavorite: () {
                          bookingController.toggleFavorite(index);
                        },
                      );
                    },
                  ),

                  // Footer
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Powered by Radical_Start',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
