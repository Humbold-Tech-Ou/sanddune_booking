import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/checkin_checkout.dart';
import 'package:sanddune_booking/presentation/widgets/filters_panel.dart';
import 'package:sanddune_booking/presentation/widgets/room_card.dart';
import 'package:sanddune_booking/presentation/widgets/room_persons.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 300, child: CheckinCheckout()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 300, child: RoomPersons()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("submit"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 300, child: FiltersPanel()),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return RoomCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                          title: 'Habitaciones Generales',
                          description:
                              'Nuestras habitaciones generales ofrecen espacio y comodidad con múltiples dormitorios y una acogedora sala de estar. Disfrute de televisores de pantalla plana, Wi-Fi gratuito y una pequeña cocina.',
                          price: '1 400,00 Bs',
                          available: 6,
                          maxGuests:
                              '4 Máximo de invitados:\n2 Adultos, 2 Niños',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
