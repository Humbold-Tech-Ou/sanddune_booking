import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/surrounding_category.dart';

class SurroundingsSection extends StatelessWidget {
  const SurroundingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SurroundingCategory(
          title: 'Lugares de interés',
          items: [
            {'name': 'Pretty Bay', 'distance': '0,2 km'},
            {'name': 'St. George’s Bay', 'distance': '0,7 km'},
            {'name': 'Ghar Dalam Cave and Museum', 'distance': '1,5 km'},
            {'name': 'Borg in-Nadur Temples', 'distance': '1,2 km'},
            {'name': 'Marsaxlokk Fishing Village', 'distance': '3,5 km'},
            {'name': 'Blue Grotto', 'distance': '8 km'},
          ],
        ),
        const SizedBox(height: 16),
        SurroundingCategory(
          title: 'Transporte público',
          items: [
            {'name': 'Parada de autobús Birżebbuġa', 'distance': '0,3 km'},
            {'name': 'Parada de autobús Pretty Bay', 'distance': '0,2 km'},
          ],
        ),
        const SizedBox(height: 16),
        SurroundingCategory(
          title: 'Aeropuertos más cercanos',
          items: [
            {'name': 'Aeropuerto Internacional de Malta', 'distance': '5,5 km'},
          ],
        ),
      ],
    );
  }
}
