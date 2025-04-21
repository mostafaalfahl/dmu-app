import 'package:d_u/views/active_sessions/sessions.dart';
import 'package:d_u/widgets/custom_drawer.dart';
import 'package:d_u/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D6CB4),
      ),
      backgroundColor: const Color(0xFFE8EBF2),
      drawer: const CustomDrawer(),
      body: Column(
        key: scaffoldkey,
        children: [
          const HomeAppbar(),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SessionsView()),
                    );
                  },
                  child: const Text(
                    'Active sessions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF06224D),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 50,
                  color: const Color(0xFF06224D),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SessionsView()),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: const Color(0xFF557DBB),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_rounded),
            label: 'Shedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
