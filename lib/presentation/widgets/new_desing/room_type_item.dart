import 'package:flutter/material.dart';

class RoomTypeItem extends StatelessWidget {
  final String roomName;
  final String description;
  final int guests;
  final int kids;
  final double price;
  final int availableRooms;

  const RoomTypeItem({
    super.key,
    required this.roomName,
    required this.description,
    required this.guests,
    required this.kids,
    required this.price,
    required this.availableRooms,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomName,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: Colors.grey),
                Text(
                  '$guests adultos',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (kids > 0) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.child_care, size: 16, color: Colors.grey),
                  Text(
                    '$kids niños',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${price.toStringAsFixed(2)} €',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                FilledButton(
                  onPressed: availableRooms > 0 ? () {} : null,
                  child: Text(
                    availableRooms > 0 ? 'Ver disponibilidad' : 'No disponible',
                  ),
                ),
              ],
            ),
            if (availableRooms > 0)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$availableRooms habitaciones disponibles',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
