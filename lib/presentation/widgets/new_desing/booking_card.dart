import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/info_chip.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/section_title.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/services_wrap.dart';
/*comentario random */

class BookingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Desde 1.400,00 €',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Reservar ahora'),
              ),
            ),
            const SizedBox(height: 24),
            SectionTitle(text: 'Servicios incluidos'),
            const SizedBox(height: 8),
            ServicesWrap(
              services: const [
                'Recepción 24 horas',
                'Playa',
                'Desayuno',
                'Internet',
                'Admite mascotas',
              ],
            ),
            const SizedBox(height: 24),
            SectionTitle(text: 'Capacidad y disponibilidad'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                InfoChip(icon: Icons.person, label: 'Adultos', value: '2'),
                InfoChip(icon: Icons.child_care, label: 'Niños', value: '1'),
                InfoChip(
                  icon: Icons.meeting_room,
                  label: 'Disponibles',
                  value: '31',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
