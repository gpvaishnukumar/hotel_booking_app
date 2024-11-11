import 'package:flutter/material.dart';

class AdView extends StatelessWidget {
  const AdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Use a larger height based on the screen height (e.g., 30% of the screen height)
    double adHeight = screenHeight * 0.3; // 30% of the screen height for the ad

    return Padding(
      padding: const EdgeInsets.all(16.0), // Add some padding for spacing
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0), // Set the circular radius
        child: Container(
          width: screenWidth, // Full width of the available space
          height: adHeight, // Adaptive height based on the screen size
          color: Colors.blueGrey, // Set a background color for the ad
          child: Stack(
            fit: StackFit.expand, // Make sure the image fills the container
            children: [
              // Display the image in the background
              Image.network(
                'https://images.unsplash.com/photo-1584695930358-3255ec241088?q=80&w=947&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover, // Ensure the image fills the container without distorting it
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: Center(child: Icon(Icons.broken_image, size: 50)),
                  );
                },
              ),
              // Add the text at the top-left corner
              Positioned(
                top: 16.0,
                left: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosting fee for \n as low as 1%',
                      style: TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 24.0, // Increased font size for better visibility
                        fontWeight: FontWeight.bold,
                        height: 1.2, // Adjust line height
                      ),
                    ),
                    SizedBox(height: 12), // Space between the text and button
                    // Button with smaller size and improved styling
                    ElevatedButton(
                      onPressed: () {
                        // Add your action here
                        print("Become a Host button pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300, // Light red button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Reduced padding for smaller button
                        elevation: 5.0, // Add shadow for depth
                      ),
                      child: Text(
                        'Become a Host',
                        style: TextStyle(
                          color: Colors.white, // White text color for the button
                          fontSize: 14.0, // Slightly smaller text size for the button label
                          fontWeight: FontWeight.bold, // Bold text for emphasis
                        ),
                      ),
                    ),
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
