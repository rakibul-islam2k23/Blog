import 'package:final_project/Views/blog/blog_screen.dart';
import 'package:final_project/Views/bookmarks/bookmarks_screen.dart';
import 'package:final_project/Views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;
final List<Widget> pages = [
  const BlogScreen(),
  const BookmarksScreen(),
  const ProfileScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: IndexedStack(index: currentIndex, children: pages),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Color(0xFF1C1F26),
        currentIndex: currentIndex,
        unselectedItemColor: Colors.white.withOpacity(.3),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Blog"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: "Bookmarks",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
      ),
    );
  }
}
