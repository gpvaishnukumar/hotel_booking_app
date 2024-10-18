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
  }) : isFavorite = isFavorite ?? RxBool(false); // Default to not favorite if null
}
