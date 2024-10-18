import 'package:get/get.dart';

class Location {
  final String imageUrl;
  final String countryName;

  Location({required this.imageUrl, required this.countryName});
}

class LocationController extends GetxController {
  var popularLocations = <Location>[
    Location(
      imageUrl: 'https://plus.unsplash.com/premium_photo-1661919589683-f11880119fb7?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      countryName: 'India',
    ),
    Location(
      imageUrl: 'https://plus.unsplash.com/premium_photo-1697729939290-40a6275148cd?q=80&w=1362&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      countryName: 'Moscow',
    ),
    Location(
      imageUrl: 'https://plus.unsplash.com/premium_photo-1681803531285-75db948035d3?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      countryName: 'USA',
    ),
    Location(
      imageUrl: 'https://images.unsplash.com/photo-1518684079-3c830dcef090?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      countryName: 'Dubai',
    ),
    Location(
      imageUrl: 'https://images.unsplash.com/photo-1506104489822-562ca25152fe?q=80&w=869&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      countryName: 'Canada',
    ),
  ].obs;
}
