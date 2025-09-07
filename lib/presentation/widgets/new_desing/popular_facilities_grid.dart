import 'package:flutter/material.dart';

class PopularFacilitiesGrid extends StatelessWidget {
  const PopularFacilitiesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> facilities = [
      {'icon': Icons.pool, 'label': 'Piscina'},
      {'icon': Icons.wifi, 'label': 'WiFi gratis'},
      {'icon': Icons.family_restroom, 'label': 'Habitaciones familiares'},
      {'icon': Icons.smoke_free, 'label': 'Habitaciones sin humo'},
      {'icon': Icons.restaurant, 'label': 'Restaurante'},
      {'icon': Icons.local_bar, 'label': 'Bar'},
      {'icon': Icons.breakfast_dining, 'label': 'Desayuno'},
      {'icon': Icons.beach_access, 'label': 'Frente a la playa'},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 12,
      children: facilities
          .map(
            (facility) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  facility['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(facility['label'] as String),
              ],
            ),
          )
          .toList(),
    );
  }
}
