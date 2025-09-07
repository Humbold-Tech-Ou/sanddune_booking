import 'package:flutter/material.dart';

class RoomPersons extends StatefulWidget {
  const RoomPersons({super.key});

  @override
  State<RoomPersons> createState() => _RoomPersonsState();
}

class _RoomPersonsState extends State<RoomPersons> {
  int persons = 1;
  int kids = 0;
  void _addPersons() {
    setState(() {
      persons++;
    });
  }

  void _removePersons() {
    setState(() {
      if (persons >= 1) persons--;
    });
  }

  void _addKids() {
    setState(() {
      kids++;
    });
  }

  void _removeKids() {
    setState(() {
      if (persons >= 1) persons--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showGuestPicker(context),
      child: Row(
        children: [
          Icon(Icons.person),
          SizedBox(width: 10),
          Text("$persons Adulto - $kids Niño"),
        ],
      ),
    );
  }

  // Muestra un dialog con el selector de rango de fechas
  void _showGuestPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Adultos"),
                  SizedBox(width: 20),
                  IconButton(onPressed: _addPersons, icon: Icon(Icons.add)),
                  Text("1"),
                  IconButton(
                    onPressed: _removePersons,
                    icon: Icon(Icons.remove),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Niños"),
                  SizedBox(width: 20),
                  IconButton(onPressed: _addKids, icon: Icon(Icons.add)),
                  Text("1"),
                  IconButton(onPressed: _removeKids, icon: Icon(Icons.remove)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
