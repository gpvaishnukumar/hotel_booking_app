import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/booking_controller.dart';
import '../models/hotel_model.dart';

class FilteredResultsView extends StatelessWidget {
  final String selectedFilter;

  const FilteredResultsView({Key? key, required this.selectedFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.find<BookingController>();
    List<Hotel> filteredHotels = _getFilteredHotels(bookingController.hotels);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFilter),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Adjust aspect ratio for grid items
        ),
        itemCount: filteredHotels.length,
        itemBuilder: (context, index) {
          final hotel = filteredHotels[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    hotel.imageUrl,
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  hotel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('\$${hotel.price} /night'),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(hotel.rating.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Hotel> _getFilteredHotels(List<Hotel> allHotels) {
    switch (selectedFilter) {
      case 'Popular Locations':
        return allHotels.where((hotel) => hotel.isPopular).toList(); // Modify according to your model
      case 'Recommended':
        return allHotels.where((hotel) => hotel.isRecommended).toList(); // Modify according to your model
      case 'Most Viewed':
        return allHotels.where((hotel) => hotel.isMostViewed).toList(); // Modify according to your model
      default:
        return allHotels;
    }
  }
}
