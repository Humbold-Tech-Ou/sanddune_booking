import 'package:flutter/material.dart';

class DesktopDetails extends StatelessWidget {
  const DesktopDetails({super.key});

  String _resolveCurrencySymbol(int? currencyId) {
    // Ajusta este mapeo según tu API
    const Map<int, String> mapping = {
      1: '€',
      2: '£',
      3: '¥',
      4: '₹',
      5: '₡',
      6: '24', // $
    };
    return mapping[currencyId ?? -1] ?? '24';
  }

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo (mock) mientras no se conecte la API
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

    final String roomTypeName = room['roomTypeName']?.toString() ?? 'Room';
    final String shortName = room['shortName']?.toString() ?? '';
    final String shortDescription = room['shortDescription']?.toString() ?? '';
    final String description = room['description']?.toString() ?? '';
    final List<dynamic> servicesDyn =
        (room['services'] as List?) ?? <dynamic>[];
    final List<String> services = servicesDyn.map((e) => e.toString()).toList();
    final String? primaryImage = room['primaryImage'] as String?;
    final double price = (room['defaultPrice'] is num)
        ? (room['defaultPrice'] as num).toDouble()
        : 0.0;
    final int? currencyId = room['defaultCurrency'] as int?;
    final int availableRooms = (room['defaultAvailableRooms'] is num)
        ? (room['defaultAvailableRooms'] as num).toInt()
        : 0;
    final int guests = (room['guests'] is num)
        ? (room['guests'] as num).toInt()
        : 0;
    final int kids = (room['kids'] is num) ? (room['kids'] as num).toInt() : 0;

    final String currencySymbol = _resolveCurrencySymbol(currencyId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(roomTypeName), centerTitle: false),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Columna izquierda: imagen + info
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeaderTitle(title: roomTypeName, badge: shortName),
                        const SizedBox(height: 16),
                        _PrimaryImage(imageName: primaryImage),
                        const SizedBox(height: 16),
                        if (shortDescription.isNotEmpty)
                          Text(
                            shortDescription,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        const SizedBox(height: 12),
                        if (description.isNotEmpty)
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        const SizedBox(height: 24),
                        const SizedBox(height: 32),
                        // Sección de capacidad y disponibilidad movida a la tarjeta de la derecha
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                // Columna derecha: card de reserva
                Expanded(
                  flex: 2,
                  child: _BookingCard(
                    price: price,
                    currencySymbol: currencySymbol,
                    availableRooms: availableRooms,
                    services: services,
                    guests: guests,
                    kids: kids,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  final String title;
  final String badge;

  const _HeaderTitle({required this.title, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        if (badge.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(badge, style: Theme.of(context).textTheme.labelLarge),
          ),
      ],
    );
  }
}

class _PrimaryImage extends StatelessWidget {
  final String? imageName;

  const _PrimaryImage({required this.imageName});

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(16);

    Widget placeholder = Container(
      height: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: radius,
      ),
      child: const Center(
        child: Icon(Icons.image_not_supported_outlined, size: 48),
      ),
    );

    if (imageName == null || imageName!.isEmpty) {
      return placeholder;
    }

    // Si tu backend expone un dominio/basePath, actualiza baseUrl aquí.
    const String baseUrl = '';
    final String imageUrl = baseUrl.isEmpty
        ? imageName!
        : '$baseUrl/$imageName';

    return ClipRRect(
      borderRadius: radius,
      child: Image.network(
        imageUrl,
        height: 320,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => placeholder,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: radius,
            ),
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _ServicesWrap extends StatelessWidget {
  final List<String> services;

  const _ServicesWrap({required this.services});

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return Text(
        'No hay servicios listados',
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: services.map((service) => Chip(label: Text(service))).toList(),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text('$label: ', style: Theme.of(context).textTheme.labelLarge),
          Text(value, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final double price;
  final String currencySymbol;
  final int availableRooms;
  final List<String> services;
  final int guests;
  final int kids;

  const _BookingCard({
    required this.price,
    required this.currencySymbol,
    required this.availableRooms,
    required this.services,
    required this.guests,
    required this.kids,
  });

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
            Text('Desde', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$currencySymbol${price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 6),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    'por noche',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: availableRooms > 0 ? () {} : null,
                child: const Text('Reservar ahora'),
              ),
            ),
            const SizedBox(height: 24),
            _SectionTitle(text: 'Capacidad y disponibilidad'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                _InfoChip(
                  icon: Icons.person,
                  label: 'Adultos',
                  value: guests.toString(),
                ),
                _InfoChip(
                  icon: Icons.child_care,
                  label: 'Niños',
                  value: kids.toString(),
                ),
                _InfoChip(
                  icon: Icons.meeting_room,
                  label: 'Disponibles',
                  value: availableRooms.toString(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionTitle(text: 'Servicios incluidos'),
            const SizedBox(height: 8),
            _ServicesWrap(services: services),
          ],
        ),
      ),
    );
  }
}
