import 'package:d_u/widgets/attendance_card.dart';
import 'package:flutter/material.dart';

class AttendanceLecture extends StatelessWidget {
  final List<Map<String, String>> attendanceList = List.generate(10, (index) {
    return {
      "name": "Ahmed Fathi",
      "email": "s2021784515448@cis.dmu.edu.eg",
      "time": "9:01 AM",
      "status": "present",
    };
  });

  AttendanceLecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
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
                  'Attendance Lecture',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendanceList.length,
              itemBuilder: (context, index) {
                final item = attendanceList[index];
                return AttendanceCard(
                  name: item['name']!,
                  email: item['email']!,
                  time: item['time']!,
                  status: item['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
