import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/question_item.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionItem(
          question:
              '¿Qué tipo de habitación puedo reservar en CA Sand Dune Hotel?',
          answer:
              'Las opciones de habitación en CA Sand Dune Hotel son: Doble, Suite, Familiar.',
        ),
        QuestionItem(
          question: '¿Cuánto cuesta alojarse en CA Sand Dune Hotel?',
          answer:
              'Los precios en CA Sand Dune Hotel pueden variar según la estancia (fechas, condiciones del hotel, etc.). Elige tus fechas para ver el precio.',
        ),
        QuestionItem(
          question: '¿CA Sand Dune Hotel tiene piscina?',
          answer:
              'Sí, el hotel tiene piscina. Puedes encontrar más información sobre la piscina y otras instalaciones en esta página.',
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            onPressed: () {},
            child: const Text('Hacer una pregunta'),
          ),
        ),
      ],
    );
  }
}
