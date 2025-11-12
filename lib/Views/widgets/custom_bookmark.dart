import 'package:flutter/material.dart';

class CustomBookmark extends StatelessWidget {
  const CustomBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/onboarding_background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "Seo strategies for beginners",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "inter",
                  ),
                ),
                Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  "Seo strategies for beginners.Seo strategies for beginners.Seo strategies for beginners.Seo strategies for beginners.Seo strategies for beginners",
                  style: TextStyle(
                    color: Color(0xFF9EA6BA),
                    fontSize: 14,
                    fontFamily: "inter",
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
