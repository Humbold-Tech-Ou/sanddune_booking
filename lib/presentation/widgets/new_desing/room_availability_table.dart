import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/screens/desktop_details.dart';

class RoomAvailabilityTable extends StatefulWidget {
  const RoomAvailabilityTable({super.key});

  @override
  State<RoomAvailabilityTable> createState() => RoomAvailabilityTableState();
}

class RoomAvailabilityTableState extends State<RoomAvailabilityTable> {
  final sandColor = const Color(0xFFF5E9DA); // Fondo tipo arena
  final sandHeader = const Color(0xFFEAD7B7); // Encabezado más oscuro
  final sandBorder = const Color(0xFFD2B48C); // Borde arena
  final sandText = const Color(0xFF8B6F3D); // Texto marrón suave

  // Simulación de precios y cantidad seleccionada por habitación
  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'Habitación Doble Deluxe con balcón - 1 o 2 camas',
      'details': '1 cama doble grande 🛏️ o 2 camas individuales 🛏️🛏️',
      'adults': 2,
      'kids': 0,
      'info': false,
      'price': 200,
      'taxes': 1,
      'selected': 0,
    },
    {
      'name': 'Habitación Superior con cama extragrande',
      'details': '1 cama doble grande 🛏️',
      'adults': 2,
      'kids': 2,
      'info': true,
      'price': 220,
      'taxes': 2,
      'selected': 0,
    },
    {
      'name': 'Habitación con cama extragrande y vistas al mar',
      'details': '1 cama doble grande 🛏️',
      'adults': 2,
      'kids': 2,
      'info': true,
      'price': 250,
      'taxes': 2,
      'selected': 0,
    },
    {
      'name': 'Habitación Triple Deluxe',
      'details':
          '1 sofá cama 🛋️ y 1 cama doble grande 🛏️ o 2 camas individuales 🛏️🛏️ y 1 sofá cama 🛋️',
      'adults': 3,
      'kids': 2,
      'info': true,
      'price': 270,
      'taxes': 3,
      'selected': 0,
    },
    {
      'name': 'Suite con vistas al mar',
      'details': '1 cama doble grande 🛏️',
      'adults': 2,
      'kids': 2,
      'info': true,
      'price': 300,
      'taxes': 4,
      'selected': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: sandBorder, width: 1),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3), // Tipo de habitación
          1: FlexColumnWidth(2), // Número de personas
          2: FlexColumnWidth(2), // Precio de hoy
          3: FlexColumnWidth(2), // Seleccionar habitaciones
        },
        border: TableBorder.symmetric(
          inside: BorderSide(color: sandBorder, width: 0.5),
          outside: BorderSide.none,
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: sandHeader,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Tipo de habitación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: sandText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Número de personas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: sandText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Precio de hoy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: sandText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Seleccionar habitaciones',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: sandText,
                  ),
                ),
              ),
            ],
          ),
          ...rooms.asMap().entries.map((entry) {
            final i = entry.key;
            final room = entry.value;
            return TableRow(
              decoration: BoxDecoration(color: sandColor),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              insetPadding: const EdgeInsets.all(40),
                              child: SizedBox(
                                width: 900,
                                child: DesktopDetails(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          room['name'] as String,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        room['details'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: sandText.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ...List.generate(
                        room['adults'] as int,
                        (i) => Icon(Icons.person, size: 18, color: sandText),
                      ),
                      if ((room['kids'] as int) > 0) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.child_care, size: 18, color: sandText),
                        if (room['info'] as bool)
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.info_outline,
                              size: 16,
                              color: sandText.withOpacity(0.7),
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'US\$${room['price']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '+ US\$${room['taxes']} de impuestos y cargos',
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (rooms[i]['selected'] > 0)
                              rooms[i]['selected']--;
                          });
                        },
                      ),
                      Text(
                        '${room['selected']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            rooms[i]['selected']++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
