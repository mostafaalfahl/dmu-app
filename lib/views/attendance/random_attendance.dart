import 'package:d_u/widgets/random_attendance_card.dart';
import 'package:flutter/material.dart';

class RandomAttendanceScreen extends StatelessWidget {
  final List<Map<String, String>> students = List.generate(7, (index) {
    return {
      "name": "Ahmed Fathi",
      "email": "s2021784515448@cis.dmu.edu.eg",
    };
  });

  RandomAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF06224D),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(width: 35),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D2442),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4)
                    ],
                  ),
                  child: const Text(
                    'Random Attendance',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return RandomAttendanceCard(
                    name: student['name']!,
                    email: student['email']!,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
