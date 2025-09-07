import 'package:flutter/material.dart';

class DesktopDetails extends StatelessWidget {
  final String hotelName;
  final String description;

  const DesktopDetails({
    super.key,
    required this.hotelName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotelName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description),
      ),
    );
  }
}
