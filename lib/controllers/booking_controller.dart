import 'package:get/get.dart';

import '../models/hotel_model.dart';

class BookingController extends GetxController {
  var hotels = <Hotel>[].obs;
  var selectedHotel = Rxn<Hotel>();

  void fetchHotels() {
    hotels.value = [
      Hotel(
        id: '1',
        name: 'Hotel Sunshine',
        location: 'New York',
        price: 150.0,
        imageUrl:
            'https://images.unsplash.com/photo-1464703278390-df5b3f1f61b2?q=80&w=873&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 4.5,
        description: 'A beautiful hotel located in the heart of New York City, offering stunning views and luxurious amenities.',

      ),
      Hotel(
        id: '2',
        name: 'Sea Breeze Resort',
        location: 'Miami',
        price: 200.0,
        imageUrl:
            'https://images.unsplash.com/photo-1501117716987-c8c394bb29df?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 4.5,
        description: 'A beautiful hotel located in the heart of New York City, offering stunning views and luxurious amenities.',

      ),
      Hotel(
        id: '3',
        name: 'Mountain Escape',
        location: 'Dubai',
        price: 180.0,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1687960116497-0dc41e1808a2?q=80&w=871&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 4.5,
        description: 'A beautiful hotel located in the heart of New York City, offering stunning views and luxurious amenities.',

      ),
      Hotel(
        id: '4',
        name: 'Grece',
        location: 'Newyork',
        price: 180.0,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1686782502385-2de1281e9b0e?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 1,
        description: 'A beautiful hotel located in the heart of New York City, offering stunning views and luxurious amenities.',

      ),
      Hotel(
        id: '5',
        name: 'Mountain',
        location: 'Miami',
        price: 180.0,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1683121837356-f458c940f0ad?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 4.5,
        description: 'A beautiful hotel located in the heart of New York City, offering stunning views and luxurious amenities.',

      ),
    ];
  }

  void selectHotel(Hotel hotel) {
    selectedHotel.value = hotel;
  }

  void toggleFavorite(int index) {
    hotels[index].isFavorite.value = !hotels[index].isFavorite.value; // Toggle the wishlist status
  }

  @override
  void onInit() {
    super.onInit();
    fetchHotels();
  }
}
