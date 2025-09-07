import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/screens/desktop_details.dart';

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
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                width: 160,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            // Info principal
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (available <= 5)
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
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
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
              ),
            ),
            // Precio y acciones
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Por noche',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 180,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.people_outline),
                    label: const Text('Seleccionar ocupación'),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 76, 77, 78),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DesktopDetails(),
                        ),
                      );
                    },
                    child: const Text(
                      'Reservar ahora',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
