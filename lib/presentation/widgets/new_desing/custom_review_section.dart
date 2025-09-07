import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/individual_review.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/review_category_bar.dart';

class CustomerReviewsSection extends StatelessWidget {
  const CustomerReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ReviewCategoryBar(label: 'Personal', score: 9.0),
            ReviewCategoryBar(label: 'Servicios', score: 8.5),
            ReviewCategoryBar(label: 'Limpieza', score: 9.2),
          ],
        ),
        Row(
          children: [
            ReviewCategoryBar(label: 'Ubicación', score: 9.5),
            ReviewCategoryBar(label: 'Comodidad', score: 8.8),
            ReviewCategoryBar(label: 'Calidad-precio', score: 8.7),
          ],
        ),
        const SizedBox(height: 16),
        IndividualReview(
          name: 'Juan P.',
          date: '2023-10-26',
          reviewText:
              'Excelente ubicación y personal muy amable. Las habitaciones son cómodas y limpias. ¡Volveremos!',
          rating: 9.0,
        ),
        const SizedBox(height: 16),
        IndividualReview(
          name: 'Maria G.',
          date: '2023-11-15',
          reviewText:
              'El desayuno es muy bueno y la piscina es fantástica. Un poco ruidoso por la noche, pero en general una buena estancia.',
          rating: 8.0,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Ver todos los comentarios'),
        ),
      ],
    );
  }
}
