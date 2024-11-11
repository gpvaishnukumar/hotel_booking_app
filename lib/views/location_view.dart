import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/location_controller.dart';

class LocationView extends StatelessWidget {
  final LocationController locationController = Get.find<LocationController>(); // Get the LocationController

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Popular Locations Section
        Text(
          'Popular Locations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          height: screenWidth * 0.35, // Set height to 35% of screen width for a better aspect ratio

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locationController.popularLocations.length,
            itemBuilder: (context, index) {
              final location = locationController.popularLocations[index];
              return Container(
                width: screenWidth * 0.25, // Set width to 40% of screen width
                margin: EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        location.imageUrl,
                        height: screenWidth * 0.35, // Match height
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
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Text(
                        location.countryName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
