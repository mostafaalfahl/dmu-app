import 'package:d_u/views/sign_in/signin_screens.dart';
import 'package:d_u/widgets/choose_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {'title': 'Welcome,', 'description': 'To Damanhour University'},
    {
      'title': 'Features overview',
      'description':
          'The attendance application is designed To simplify and facilitate the process of tracking student attendance at university lectures.'
    },
    {
      'title': 'Benefits of the application',
      'description':
          'Quick attendance recording without the need for paper rosters,register is reliable based on GPS'
    },
    {
      'title': 'Get started',
      'description':
          'Let\'s get started on how to learn about our attendance app'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () {
                  _currentPage = index;
                },
              );
            },
            itemCount: onboardingData.length + 1,
            itemBuilder: (context, index) {
              if (index == onboardingData.length) {
                return const ChooseOptionScreen();
              }
              return OnboardingPage(
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _currentPage > 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  )
                : const SizedBox(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _currentPage < onboardingData.length
                ? IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('images/Back.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              // ignore: deprecated_member_use
              const Color(0xFF325B99).withOpacity(0.6),
              BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.school, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          Text(title,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(description,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 227, 226, 226)),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class ChooseOptionScreen extends StatelessWidget {
  const ChooseOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('images/Back.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              // ignore: deprecated_member_use
              const Color(0xFF325B99).withOpacity(0.6),
              BlendMode.darken),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose your option',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 20),
            ChooseButton(
                text: "Doctor",
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                }),
            const SizedBox(height: 25),
            const ChooseButton(text: 'Student'),
          ],
        ),
      ),
    );
  }
}
