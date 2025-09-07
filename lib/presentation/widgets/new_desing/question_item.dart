import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question, style: Theme.of(context).textTheme.titleSmall),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
