import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  final TextEditingController nameController =
      TextEditingController(text: 'Alaa Mostafa');
  final TextEditingController emailController =
      TextEditingController(text: 'Alaamostafa123@gmail.com');
  final TextEditingController dobController =
      TextEditingController(text: '11 / 9 / 1985');
  final TextEditingController departmentController =
      TextEditingController(text: 'IT');
  final TextEditingController phoneController =
      TextEditingController(text: '01123547891');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDDEE5),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Color(0xFF06224D)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  if (!isEditing)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF06224D)),
                      onPressed: () => setState(() => isEditing = true),
                    ),
                ],
              ),
              Center(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                    if (isEditing)
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt,
                              size: 16, color: Colors.black),
                        ),
                      ),
                    const Expanded(
                      child: ListTile(
                        title: Text(
                          "Alaa mostafa",
                          style: TextStyle(
                            color: Color(0xFF06224D),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Alaamostafa123@gmail.com",
                          style: TextStyle(
                            color: Color(0xFF06224D),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField('Name', nameController, enabled: isEditing),
              _buildTextField('Email', emailController, enabled: isEditing),
              _buildTextField('Date Of Birth', dobController,
                  enabled: isEditing),
              _buildTextField('Department :', departmentController,
                  enabled: isEditing),
              _buildTextField('Phone', phoneController, enabled: isEditing),
              const SizedBox(
                height: 15,
              ),
              if (isEditing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () => setState(() => isEditing = false),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 14),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF06224D),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => isEditing = false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF06224D),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 34, vertical: 14),
                      ),
                      child: const Text(
                        'Save Change',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool enabled = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF06224D),
            ),
          ),
          const SizedBox(height: 3),
          TextField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
