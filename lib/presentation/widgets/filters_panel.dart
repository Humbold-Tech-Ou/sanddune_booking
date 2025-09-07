import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/checkin_checkout.dart';
import 'package:sanddune_booking/presentation/widgets/room_persons.dart';

class FiltersPanel extends StatefulWidget {
  const FiltersPanel({super.key});

  @override
  State<FiltersPanel> createState() => _FiltersPanelState();
}

class _FiltersPanelState extends State<FiltersPanel> {
  final amenities = [
    'Wi-Fi',
    'Periódico',
    'Energía de respaldo',
    'Refrigerador',
    'Restaurante',

  ];
  final selectedAmenities = <String>{};

  double minPrice = 1400;
  double maxPrice = 3080;
  RangeValues priceRange = const RangeValues(1400, 3080);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Bloque superior: Fechas + Personas + Submit
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Búsqueda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Divider(color: Colors.blue, thickness: 2, endIndent: 160),
                CheckinCheckout(),
                const SizedBox(height: 12),
                RoomPersons(),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Buscar'),
                  ),
                ),
              ],
            ),
          ),
          // Amenities
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Filtros',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(() => selectedAmenities.clear()),
                      child: const Text(
                        'Clear Filter',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.blue, thickness: 2, endIndent: 200),
                ...amenities.map(
                  (amenity) => CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(amenity, style: const TextStyle(fontSize: 15)),
                    value: selectedAmenities.contains(amenity),
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          selectedAmenities.add(amenity);
                        } else {
                          selectedAmenities.remove(amenity);
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                  ),
                ),
              ],
            ),
          ),
          // Price
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(
                        () => priceRange = RangeValues(minPrice, maxPrice),
                      ),
                      child: const Text(
                        'Clear Filter',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.blue, thickness: 2, endIndent: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${minPrice.toStringAsFixed(0)} Bs',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '${maxPrice.toStringAsFixed(0)} Bs',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                RangeSlider(
                  values: priceRange,
                  min: minPrice,
                  max: maxPrice,
                  divisions: ((maxPrice - minPrice) ~/ 100),
                  activeColor: Colors.blue,
                  onChanged: (values) {
                    setState(() {
                      priceRange = values;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
