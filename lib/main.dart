import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/screens/homepage.dart';
import 'package:sanddune_booking/presentation/screens/details_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Color.fromRGBO(219, 203, 164, 1)),
      home: Homepage(),
      routes: {'/details': (context) => const DetailsPage()},
    );
  }
}
