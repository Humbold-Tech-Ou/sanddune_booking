import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/checkin_checkout.dart';
import 'package:sanddune_booking/presentation/widgets/room_card.dart';
import 'package:sanddune_booking/presentation/widgets/room_persons.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final List<String> amenities = const [
    'Wi-Fi',
    'Periódico',
    'Energía de respaldo',
    'Refrigerador',
    'Restaurante',
  ];
  final Set<String> selectedAmenities = <String>{};

  double minPrice = 1400;
  double maxPrice = 3080;
  RangeValues priceRange = const RangeValues(1400, 3080);

  void _openFiltersDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 520),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Filtros',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setState(() => selectedAmenities.clear());
                        },
                        child: Text(
                          'Limpiar',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: amenities
                          .map(
                            (a) => CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              value: selectedAmenities.contains(a),
                              onChanged: (v) {
                                setState(() {
                                  if (v == true) {
                                    selectedAmenities.add(a);
                                  } else {
                                    selectedAmenities.remove(a);
                                  }
                                });
                              },
                              title: Text(a),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Aplicar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset("assets/images/Max-power-10.png"),
        backgroundColor: const Color.fromARGB(255, 76, 77, 78),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Color.fromRGBO(219, 203, 164, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Bloque de búsqueda móvil
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CheckinCheckout(),
                  const SizedBox(height: 12),
                  RoomPersons(),
                  const SizedBox(height: 12),
                  Text(
                    'Precio',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${minPrice.toStringAsFixed(0)} €'),
                      Text('${maxPrice.toStringAsFixed(0)} €'),
                    ],
                  ),
                  RangeSlider(
                    values: priceRange,
                    min: minPrice,
                    max: maxPrice,
                    divisions: ((maxPrice - minPrice) ~/ 100),
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (values) {
                      setState(() {
                        priceRange = values;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _openFiltersDialog,
                          icon: const Icon(Icons.tune),
                          label: const Text('Filtros'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text('Buscar'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (selectedAmenities.isNotEmpty)
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: selectedAmenities
                          .map(
                            (e) => Chip(
                              label: Text(e),
                              onDeleted: () => setState(() {
                                selectedAmenities.remove(e);
                              }),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Lista de habitaciones
          ...List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/details'),
                child: RoomCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                  title: 'Habitaciones Generales',
                  description:
                      'Nuestras habitaciones generales ofrecen espacio y comodidad con múltiples dormitorios y una acogedora sala de estar. Disfrute de televisores de pantalla plana, Wi-Fi gratuito y una pequeña cocina.',
                  price: '1 400,00 €',
                  available: 6,
                  maxGuests: '4 Máximo de invitados:\n2 Adultos, 2 Niños',
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
