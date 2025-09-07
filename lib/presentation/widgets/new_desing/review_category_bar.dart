import 'package:flutter/material.dart';

class ReviewCategoryBar extends StatelessWidget {
  final String label;
  final double score;

  const ReviewCategoryBar({
    super.key,
    required this.label,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: score / 10,
              backgroundColor: Colors.grey.shade200,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 4),
            Text(
              score.toStringAsFixed(1),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
