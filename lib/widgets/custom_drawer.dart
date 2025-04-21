import 'package:d_u/views/attendance/attendance_seatch.dart';
import 'package:d_u/views/editprofile/editpage.dart';
import 'package:d_u/views/setting/settingpage.dart';
import 'package:d_u/views/shedule/schedule_view.dart';
import 'package:d_u/views/sign_in/signin_screens.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2354A0), Color(0xFF020C1B)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Alaa mostafa",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Alaamostafa123@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "\t\t\t\tHome",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.home_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      "\t\t\t\tProfile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.person_2_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 6,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      "\t\t\t\tShedule",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.table_chart),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scheduleview(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 6,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      "Attendance",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.analytics_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendanceSearch(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: const Text(
                      "\t\t\t\tSetting",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.settings_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Settingpage(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
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
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Color(0xFF000D3C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
