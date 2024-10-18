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
                      width: 300,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 300,
                          height: 150,
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
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        icon: Obx(() => Icon(
                          hotel.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                          color: hotel.isFavorite.value ? Colors.red : Colors.grey,
                          size: 18,
                        )),
                        onPressed: () => onToggleFavorite(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
                    Text(hotel.location,
                        style: TextStyle(fontSize: 10),
                        )


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
