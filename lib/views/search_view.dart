import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to full screen
      color: Colors.white, // Change container color to white
      padding: EdgeInsets.all(16.0), // Add padding inside the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore the world! By\nTravelling',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16), // Space between text and TextFormField
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Circular border
                    ),
                    hintText: 'Search Hotels',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                ),
              ),
              SizedBox(width: 10), // Gap between TextFormField and filter icon
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
