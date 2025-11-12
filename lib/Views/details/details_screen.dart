import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Blog",
          leadingIcon: const Icon(Icons.menu, color: Colors.white),
          onTap: () => Navigator.pop(context),
          actionIcon: const Icon(Icons.bookmark_outline, color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/onboarding_background.png",
                  height: height * 0.30,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Future of Sustainable Living",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "newsReader",
                    ),
                  ),

                  const SizedBox(height: 15),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(),
                    title: const Text(
                      "Author",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "newsReader",
                      ),
                    ),
                    subtitle: const Text(
                      "Olivia Herper",
                      style: TextStyle(
                        color: Color(0xFF9EA6BA),
                        fontFamily: "newsReader",
                      ),
                    ),
                  ),

                  const Text(
                    "In a world increasingly aware of its environmental footprint, the concept of sustainable living has moved from a niche lifestyle to a mainstream necessity. This article explores the innovative approaches and technologies that are shaping a greener future, from renewable energy solutions to eco-friendly consumer products.",
                    style: TextStyle(
                      color: Color(0xFF9EA6BA),
                      height: 1.4,
                      fontSize: 16,
                      fontFamily: "newsReader",
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.favorite_outline,
                            size: 24,
                            color: Color(0xFF9EA6BA),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "133",
                            style: TextStyle(
                              color: Color(0xFF9EA6BA),
                              fontFamily: "newsReader",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.12),
                      Row(
                        children: const [
                          Icon(
                            Icons.comment_outlined,
                            size: 24,
                            color: Color(0xFF9EA6BA),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "45",
                            style: TextStyle(
                              color: Color(0xFF9EA6BA),
                              fontFamily: "newsReader",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Comments",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "newsReader",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
