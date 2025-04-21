import 'package:d_u/views/home/homepage.dart';
import 'package:d_u/views/sign_in/signin_screens.dart';
import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 60, left: 25, right: 20, bottom: 50),
            decoration: const BoxDecoration(
              color: Color(0xFFE8EBF2),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF06224D),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }),
                const SizedBox(width: 16),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06224D),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'App Settings',
              style: TextStyle(fontSize: 14, color: Color(0xFF3D6CB4)),
            ),
          ),
          const SizedBox(height: 10),
          _buildSettingItem(Icons.shield_outlined, 'Privacy & Permission'),
          _buildSettingItem(Icons.storage_outlined, 'Data & Storage'),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'More',
              style: TextStyle(fontSize: 16, color: Color(0xFF3D6CB4)),
            ),
          ),
          const SizedBox(height: 10),
          _buildSettingItem(Icons.help_outline, 'Help'),
          _buildSettingItem(Icons.feedback_outlined, 'Feedback'),
          _buildSettingItem(Icons.info_outline, 'About'),
          _buildSettingItem(
              Icons.mobile_screen_share_outlined, 'Invite a Friend'),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF06224D),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: const Color(0xFF4C78B8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_rounded),
            label: 'Lecture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF082B61)),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF082B61),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
