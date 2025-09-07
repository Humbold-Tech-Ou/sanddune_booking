import 'package:flutter/material.dart';

class ThingsToConsiderSection extends StatelessWidget {
  const ThingsToConsiderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'El establecimiento no dispone de recepción 24 horas. Los huéspedes deben informar al establecimiento de su hora de llegada prevista con al menos 24 horas de antelación.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'El horario de check-in es de 15:00 a 23:00. El check-out es hasta las 11:00.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
