import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String locationName;
  final String currentTime;

  const HeaderWidget({
    super.key,
    required this.locationName,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Your Weather:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 16),
            const SizedBox(width: 5),
            Text(
              locationName,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          currentTime,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}