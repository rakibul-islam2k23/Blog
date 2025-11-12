import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_bookmark.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Bookmarks",
          leadingIcon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontFamily: "inter",
                fontSize: 16,
              ),
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search bookmarks",
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(.4),
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                fillColor: Color(0xFF292E38),
                hintStyle: TextStyle(
                  color: Color(0xFF9EA6BA),
                  fontSize: 16,
                  fontFamily: "inter",
                ),
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomBookmark();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
