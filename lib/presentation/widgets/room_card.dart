import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final int available;
  final String maxGuests;

  const RoomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.available,
    required this.maxGuests,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxWidth < 600;

        Widget imageWidget = ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            imageUrl,
            width: isSmall ? double.infinity : 160,
            height: isSmall ? 180 : 120,
            fit: BoxFit.cover,
          ),
        );

        Widget infoSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isSmall ? 18 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!isSmall && available <= 5)
                  Text(
                    '¡Apurarse! $available Quedan habitaciones',
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.wifi, size: 20),
                SizedBox(width: 8),
                Icon(Icons.tv, size: 20),
                SizedBox(width: 8),
                Icon(Icons.bolt, size: 20),
                SizedBox(width: 8),
                Icon(Icons.lock, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              maxGuests,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        );

        Widget actionsSection = Column(
          crossAxisAlignment: isSmall
              ? CrossAxisAlignment.stretch
              : CrossAxisAlignment.end,
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: isSmall ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Por noche',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: isSmall ? double.infinity : 180,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.people_outline),
                label: const Text('Seleccionar ocupación'),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: isSmall ? double.infinity : 180,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 76, 77, 78),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/details');
                },
                child: const Text(
                  'Reservar ahora',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: isSmall
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageWidget,
                      const SizedBox(height: 12),
                      infoSection,
                      const SizedBox(height: 12),
                      actionsSection,
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageWidget,
                      const SizedBox(width: 16),
                      Expanded(child: infoSection),
                      const SizedBox(width: 16),
                      actionsSection,
                    ],
                  ),
          ),
        );
      },
    );
  }
}
