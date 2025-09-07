import 'package:flutter/material.dart';

class MobileDetails extends StatelessWidget {
  const MobileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<String, dynamic> room = {
      "id": 113,
      "roomTypeName": "Superior Sea View",
      "shortName": "SUSV",
      "shortDescription":
          "This bright and spacious room offers an amazing sea view, alongside a comfortable double bed or two single beds….",
      "services": [
        "24/7 Reception",
        "Beach",
        "Breakfast",
        "Internet",
        "Pets friendly",
      ],
      "images": null,
      "primaryImage": "09012025111246cover supperior.png",
      "bannerImage": null,
      "description":
          "This bright and spacious room offers an amazing sea view, alongside a comfortable double bed or two single beds and contemporary design. It’s the perfect spot for guests looking to relax and enjoy a peaceful stay with added scenic beauty.",
      "note": null,
      "defaultPrice": 95.00,
      "defaultCurrency": 6,
      "property": 99,
      "defaultAvailableRooms": 31,
      "guests": 2,
      "kids": 1,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(room['roomTypeName']?.toString() ?? 'Detalle'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MobilePrimaryImage(imageName: room['primaryImage'] as String?),
          const SizedBox(height: 16),
          Text(
            room['roomTypeName']?.toString() ?? 'Room',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          if ((room['shortName']?.toString() ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                room['shortName'] as String,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          const SizedBox(height: 12),
          if ((room['shortDescription']?.toString() ?? '').isNotEmpty)
            Text(
              room['shortDescription'] as String,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          const SizedBox(height: 8),
          if ((room['description']?.toString() ?? '').isNotEmpty)
            Text(
              room['description'] as String,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 20),
              const SizedBox(width: 6),
              Text(
                'Desde 95.00 por noche',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: () {}, child: const Text('Reservar ahora')),
          const SizedBox(height: 16),
          Text(
            'Capacidad y disponibilidad',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _MobileInfoChip(icon: Icons.person, label: 'Adultos', value: '2'),
              _MobileInfoChip(
                icon: Icons.child_care,
                label: 'Niños',
                value: '1',
              ),
              _MobileInfoChip(
                icon: Icons.meeting_room,
                label: 'Disponibles',
                value: '31',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Servicios incluidos',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (room['services'] as List<dynamic>)
                .map((e) => Chip(label: Text(e.toString())))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _MobilePrimaryImage extends StatelessWidget {
  final String? imageName;
  const _MobilePrimaryImage({required this.imageName});

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(12);
    Widget placeholder = Container(
      height: 220,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: radius,
      ),
      child: const Center(
        child: Icon(Icons.image_not_supported_outlined, size: 40),
      ),
    );

    if (imageName == null || imageName!.isEmpty) return placeholder;

    const String baseUrl = '';
    final String imageUrl = baseUrl.isEmpty
        ? imageName!
        : '$baseUrl/$imageName';

    return ClipRRect(
      borderRadius: radius,
      child: Image.network(
        imageUrl,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => placeholder,
      ),
    );
  }
}

class _MobileInfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MobileInfoChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Text('$label: ', style: Theme.of(context).textTheme.labelMedium),
          Text(value, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
