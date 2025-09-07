import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/room_type_item.dart';

class RoomTypeList extends StatelessWidget {
  const RoomTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoomTypeItem(
          roomName: 'Habitación Doble Estándar',
          description:
              'Habitación con cama doble, aire acondicionado y baño privado.',
          guests: 2,
          kids: 1,
          price: 1400.00,
          availableRooms: 5,
        ),
        RoomTypeItem(
          roomName: 'Habitación Doble Superior con vistas al mar',
          description:
              'Habitación con cama doble y vistas al mar, aire acondicionado y baño privado.',
          guests: 2,
          kids: 1,
          price: 1800.00,
          availableRooms: 3,
        ),
        RoomTypeItem(
          roomName: 'Habitación Doble Deluxe con vistas al mar',
          description:
              'Habitación de lujo con cama doble y vistas al mar, aire acondicionado y baño privado.',
          guests: 2,
          kids: 2,
          price: 2200.00,
          availableRooms: 2,
        ),
      ],
    );
  }
}
