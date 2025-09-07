import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/question_item.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionItem(
          question:
              '¿A qué distancia está CA Sand Dune Hotel del centro de Corralejo?',
          answer: 'CA Sand Dune Hotel está a 1,2 km del centro de Corralejo.',
        ),
        QuestionItem(
          question: '¿Qué se puede hacer en CA Sand Dune Hotel?',
          answer:
              'CA Sand Dune Hotel ofrece las siguientes actividades y servicios (se pueden aplicar cargos): piscina, masajes, senderismo, ciclismo, windsurf, submarinismo, pesca, campo de golf (a menos de 3 km), pista de tenis, billar, ping pong, zona de juegos infantil, club infantil, entretenimiento nocturno, casino.',
        ),
        QuestionItem(
          question: '¿Hay parking en CA Sand Dune Hotel?',
          answer: 'Sí, hay parking disponible en CA Sand Dune Hotel.',
        ),
      ],
    );
  }
}
