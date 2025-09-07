import 'package:flutter/material.dart';

class ImportantInformationSection extends StatelessWidget {
  const ImportantInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informa a CA Sand Dune Hotel con antelación de tu hora prevista de llegada. Para ello, puedes utilizar el apartado de peticiones especiales al hacer la reserva o ponerte en contacto directamente con el alojamiento. Los datos de contacto aparecen en la confirmación de la reserva.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Los huéspedes deberán mostrar un documento de identidad válido y una tarjeta de crédito al realizar el check-in. Ten en cuenta que todas las peticiones especiales están sujetas a disponibilidad y pueden comportar suplementos.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
