import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color bgColor = Color(0xFF0F172A);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color purple = Color(0xFF7C3AED);
  static const Color cyan = Color(0xFF06B6D4);
  static const Color secondaryText = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Gradient header background
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [purple, cyan],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),


                Positioned(
                  bottom: -55,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [purple, cyan],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),


            const Text(
              "SM Faiza Akter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Flutter Developer | UI/UX Enthusiast",
              style: TextStyle(
                color: secondaryText,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 25),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Follow button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Message button
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: cyan, width: 1.5),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_bubble_outline,
                                color: cyan, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}