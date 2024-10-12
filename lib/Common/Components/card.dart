
import 'package:flutter/material.dart';


class ReuseContainer extends StatelessWidget {
  final String imagePath; // Path or URL for the image
  final String text;      // The text you want to display
  final String description;      // The text you want to display
  final double containerHeight;
  final double containerWidth;

  // Constructor to accept image, text, and container size
   const ReuseContainer({super.key,
    required this.imagePath,
    required this.text,
    this.description = '',
    this.containerHeight = 150.0,
    this.containerWidth = 125.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center image and text
        children: [
          // Image widget
         Container(
           height: 50,
           width: 50,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90)
           ),
           child: Image.asset(imagePath,fit: BoxFit.cover,),
         ),
          const SizedBox(height: 10.0), // Space between image and text
          // Text widget
          Text(
            text,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

