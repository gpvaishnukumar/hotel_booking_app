import 'package:get/get.dart';

class Hotel {
  final String id;
  final String name;
  final String location;
  final double price;
  final String imageUrl;
  final double rating;
  final RxBool isFavorite; // Keep track of favorite status
  final String description; // Description property
  final bool isPopular;       // Add this property
  final bool isRecommended;   // Add this property
  final bool isMostViewed;    // Add this property

  // Constructor
  Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.rating,
    RxBool? isFavorite, // Nullable RxBool
    required this.description,
    this.isPopular = false,    // Default value
    this.isRecommended = false, // Default value
    this.isMostViewed = false,  // Default value
  }) : isFavorite = isFavorite ?? RxBool(false); // Default to not favorite if null
}
