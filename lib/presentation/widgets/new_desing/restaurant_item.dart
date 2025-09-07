import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String name;
  final String cuisine;
  final String distance;

  const RestaurantItem({
    super.key,
    required this.name,
    required this.cuisine,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.restaurant, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            '$name ($cuisine)',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(distance, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
