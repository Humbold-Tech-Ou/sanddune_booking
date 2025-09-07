import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/rule_item.dart';

class HouseRulesSection extends StatelessWidget {
  const HouseRulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RuleItem(title: 'Entrada', description: 'De 15:00 a 23:00'),
        RuleItem(title: 'Salida', description: 'De 07:00 a 11:00'),
        RuleItem(
          title: 'Cancelación/prepago',
          description:
              'Las condiciones de cancelación y pago por adelantado pueden variar según el tipo de alojamiento. Introduce las fechas de tu estancia y consulta las condiciones de la habitación seleccionada.',
        ),
        RuleItem(
          title: 'Niños y camas',
          description:
              'Se pueden alojar niños de cualquier edad. Para ver la información correcta sobre precios y ocupación, añade a la búsqueda el número de niños con los que viajas y sus edades.',
        ),
        RuleItem(
          title: 'Mascotas',
          description:
              'Se admiten bajo petición. Se pueden aplicar suplementos.',
        ),
        RuleItem(
          title: 'Restricción de edad',
          description:
              'Solo se pueden hacer reservas si la edad mínima es de 18 años.',
        ),
      ],
    );
  }
}
