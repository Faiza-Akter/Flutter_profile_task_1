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
  bool isDarkMode = true;


  static const Color darkBg = Color(0xFF0F172A);
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkSecondaryText = Color(0xFF94A3B8);


  static const Color lightBg = Color(0xFFF0FDFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightSecondaryText = Color(0xFF64748B);


  static const Color purple = Color(0xFF7C3AED);
  static const Color cyan = Color(0xFF06B6D4);

  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {

    final Color bgColor = isDarkMode ? darkBg : lightBg;
    final Color cardColor = isDarkMode ? darkCard : lightCard;
    final Color primaryText = isDarkMode ? Colors.white : const Color(0xFF0F172A);
    final Color secondaryText = isDarkMode ? darkSecondaryText : lightSecondaryText;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: Icon(Icons.menu, color: primaryText),
        title: Text(
          "Profile",
          style: TextStyle(color: primaryText, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDarkMode ? Colors.white : purple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: primaryText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz, color: primaryText),
          ),
        ],
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
                      border: Border.all(color: bgColor, width: 3),
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

            Text(
              "SM Faiza Akter",
              style: TextStyle(
                color: primaryText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
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
                      onTap: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: isFollowing ? cardColor : purple,
                          borderRadius: BorderRadius.circular(14),
                          border: isFollowing
                              ? Border.all(color: cyan, width: 1.5)
                              : null,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isFollowing ? Icons.check : Icons.add,
                                color: isFollowing ? primaryText : Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isFollowing ? "Following" : "Follow",
                                style: TextStyle(
                                  color: isFollowing ? primaryText : Colors.white,
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
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.chat_bubble_outline,
                                color: cyan, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              "Message",
                              style: TextStyle(
                                color: primaryText,
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildStatItem("7", "Projects", primaryText, secondaryText)),
                    _buildVerticalDivider(secondaryText),
                    Expanded(child: _buildStatItem("1.2K", "Followers", primaryText, secondaryText)),
                    _buildVerticalDivider(secondaryText),
                    Expanded(child: _buildStatItem("3 yrs", "Experience", primaryText, secondaryText)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile Details",
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDetailRow(Icons.email_outlined, "Email",
                      "faizaakter2004@gmail.com", cardColor, primaryText, secondaryText),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                      Icons.badge_outlined, "Student ID", "232-134-022", cardColor, primaryText, secondaryText),
                  const SizedBox(height: 12),
                  _buildDetailRow(Icons.school_outlined, "Department",
                      "Software Engineering", cardColor, primaryText, secondaryText),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                      Icons.groups_outlined, "Batch", "5th", cardColor, primaryText, secondaryText),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Passionate Flutter developer who loves building "
                          "beautiful, performant mobile applications. Currently "
                          "exploring UI/UX design and clean architecture while "
                          "completing my degree in Software Engineering.",
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color primaryText, Color secondaryText) {
    return Center(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: primaryText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: secondaryText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider(Color secondaryText) {
    return Container(
      height: 35,
      width: 1,
      color: secondaryText.withOpacity(0.3),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, Color cardColor, Color primaryText, Color secondaryText) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: secondaryText.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: purple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: cyan, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}