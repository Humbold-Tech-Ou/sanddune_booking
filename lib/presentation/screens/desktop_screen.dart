import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/filters_panel.dart';
import 'package:sanddune_booking/presentation/widgets/room_card.dart';
import 'package:sanddune_booking/presentation/widgets/checkin_checkout.dart';
import 'package:sanddune_booking/presentation/widgets/room_persons.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset("assets/images/Max-power-10.png"),
        backgroundColor: Color.fromARGB(255, 76, 77, 78),
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
      body: Column(
        children: [
          // Barra de búsqueda horizontal
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: CheckinCheckout()),
                const SizedBox(width: 16),
                Expanded(flex: 2, child: RoomPersons()),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Buscar'),
                  ),
                ),
              ],
            ),
          ),
          // Contenido principal
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 320, child: FiltersPanel()),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return RoomCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                        title: 'Habitaciones Generales',
                        description:
                            'Nuestras habitaciones generales ofrecen espacio y comodidad con múltiples dormitorios y una acogedora sala de estar. Disfrute de televisores de pantalla plana, Wi-Fi gratuito y una pequeña cocina.',
                        price: '1 400,00 €',
                        available: 6,
                        maxGuests: '4 Máximo de invitados:\n2 Adultos, 2 Niños',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
