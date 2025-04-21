import 'package:flutter/material.dart';

class RandomAttendanceCard extends StatefulWidget {
  final String name;
  final String email;

  RandomAttendanceCard({
    super.key,
    required this.name,
    required this.email,
  });
  final List<Map<String, String>> students = List.generate(7, (index) {
    return {
      "name": "Ahmed Fathi",
      "email": "s2021784515448@cis.dmu.edu.eg",
    };
  });
  @override
  State<RandomAttendanceCard> createState() => _RandomAttendanceCardState();
}

class _RandomAttendanceCardState extends State<RandomAttendanceCard> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6B91C6),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF97BCE8),
              radius: 20,
              child: Text(
                widget.name.isNotEmpty ? widget.name[0] : "?",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Text(widget.email,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      buildStatusButton("Absent", Colors.white, Colors.black),
                      const SizedBox(width: 10),
                      buildStatusButton(
                          "Present", const Color(0xFF0D2442), Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusButton(String label, Color bgColor, Color textColor) {
    bool isSelected = selectedStatus == label.toLowerCase();
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedStatus = label.toLowerCase();
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(30, 5),
        backgroundColor: isSelected ? bgColor : Colors.transparent,
        foregroundColor: isSelected ? textColor : Colors.white,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: isSelected ? 2 : 0,
      ),
      child: Text(label),
    );
  }
}
