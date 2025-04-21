import 'package:d_u/views/shedule/add_lec_view.dart';
import 'package:flutter/material.dart';

class Scheduleview extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'day': 'Tue',
      'date': '8/11',
      'group': 'G4 ( IT )',
      'subject': 'Computer Vision',
      'hall': 'Hall 1',
      'time': '9-11 AM',
      'participants': '73',
    },
    {
      'day': 'Tue',
      'date': '8/11',
      'group': 'G4 ( IT )',
      'subject': 'Computer Vision',
      'hall': 'Hall 1',
      'time': '9-11 AM',
      'participants': '73',
    },
    {
      'day': 'Tue',
      'date': '8/11',
      'group': 'G4 ( IT )',
      'subject': 'Computer Vision',
      'hall': 'Hall 1',
      'time': '9-11 AM',
      'participants': '73',
    },
  ];

  Scheduleview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Hello, Alaa Mostafa',
              style: TextStyle(fontSize: 20, color: Color(0xFF000D3C)),
            ),
          ],
        ),
        actions: [
          IconButton(
            iconSize: 40,
            icon: const Icon(Icons.add_circle_outline_outlined,
                color: Color(0xFF000D3C)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddLectureScreen();
              }));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFF000D3C)),
                    label: const Text('Oct',
                        style: TextStyle(color: Color(0xFF000D3C))),
                  ),
                  const Text(
                    'November',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000D3C)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Dec", style: TextStyle(color: Color(0xFF000D3C))),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF000D3C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(event['day']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(event['date']!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(event['group']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000D3C))),
                                Divider(
                                  color: Colors.grey[400],
                                  thickness: 1,
                                  height: 20,
                                ),
                                const SizedBox(height: 4),
                                Text(event['subject']!,
                                    style: const TextStyle(
                                        color: Color(0xFF000D3C))),
                                if (event['hall']!.isNotEmpty)
                                  Text(event['hall']!,
                                      style: const TextStyle(
                                          color: Color(0xFF000D3C))),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (event['time']!.isNotEmpty) ...[
                                      const Icon(Icons.timer_outlined,
                                          size: 22, color: Color(0xFF000D3C)),
                                      const SizedBox(width: 5),
                                      Text(event['time']!,
                                          style: const TextStyle(
                                              color: Color(0xFF000D3C))),
                                    ],
                                    const Spacer(),
                                    if (event['participants']!.isNotEmpty) ...[
                                      const Icon(Icons.people_outline,
                                          size: 22, color: Color(0xFF000D3C)),
                                      const SizedBox(width: 5),
                                      Text(event['participants']!,
                                          style: const TextStyle(
                                              color: Color(0xFF000D3C))),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: const Color(0xFF000D3C).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF557DBB),
          selectedItemColor: const Color(0xFF000D3C),
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
