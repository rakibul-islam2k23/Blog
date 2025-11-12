import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_list_sample.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Blog",
          leadingIcon: const Icon(Icons.menu, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
          actionIcon: const Icon(Icons.search, color: Colors.white),
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomListSample();
        },
      ),
    );
  }
}
