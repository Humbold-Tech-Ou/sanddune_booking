import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/restaurant_item.dart';

class RestaurantsSection extends StatelessWidget {
  const RestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestaurantItem(
          name: 'Restaurante La Vaca Azul',
          cuisine: 'Mariscos',
          distance: '0,3 km',
        ),
        RestaurantItem(
          name: 'Avenida Restaurante',
          cuisine: 'Internacional',
          distance: '0,6 km',
        ),
      ],
    );
  }
}
