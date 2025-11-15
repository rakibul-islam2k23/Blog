import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_list_sample.dart';
import 'package:final_project/api_services/posts_api.dart';
import 'package:final_project/models/posts_model.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Blog",
          leadingIcon: const Icon(Icons.menu, color: Colors.white),
          onTap: () {},
          actionIcon: const Icon(Icons.search, color: Colors.white),
        ),
      ),

      body: FutureBuilder<PostsModel>(
        future: PostsApi().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No data found',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data!.posts!.length,
              itemBuilder: (context, index) {
                return CustomListSample(
                  title: snapshot.data!.data!.posts![index].title.toString(),
                  subTitle:
                      snapshot.data!.data!.posts![index].content.toString(),
                  image:
                      snapshot.data!.data!.posts![index].featuredImage
                          .toString(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
