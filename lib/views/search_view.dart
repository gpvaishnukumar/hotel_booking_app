import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity, // Set width to full screen
      color: Colors.white, // Change container color to white
      padding: EdgeInsets.all(screenWidth * 0.04), // Add padding (4% of screen width)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore the world! By\nTravelling',
            style: TextStyle(
              fontSize: screenWidth * 0.06, // Font size adaptive (6% of screen width)
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenWidth * 0.04), // Space between text and TextFormField (4% of screen width)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Circular border
                    ),
                    hintText: 'Search Hotels',
                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adaptive padding
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02), // Gap between TextFormField and filter icon (2% of screen width)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
                child: IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // Add filter action here
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
