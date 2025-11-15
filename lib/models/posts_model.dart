// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

PostsModel postsModelFromJson(String str) =>
    PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  bool? success;
  String? message;
  Data? data;

  PostsModel({this.success, this.message, this.data});

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Post>? posts;
  Pagination? pagination;

  Data({this.posts, this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posts:
        json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    pagination:
        json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "posts":
        posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalPosts;
  int? totalPages;

  Pagination({
    this.currentPage,
    this.perPage,
    this.totalPosts,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    totalPosts: json["total_posts"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total_posts": totalPosts,
    "total_pages": totalPages,
  };
}

class Post {
  int? id;
  String? title;
  String? excerpt;
  String? content;
  String? featuredImage;
  Author? author;
  List<String>? categories;
  int? readTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic likeCount;
  String? commentCount;
  bool? isLiked;
  bool? isBookmarked;

  Post({
    this.id,
    this.title,
    this.excerpt,
    this.content,
    this.featuredImage,
    this.author,
    this.categories,
    this.readTime,
    this.createdAt,
    this.updatedAt,
    this.likeCount,
    this.commentCount,
    this.isLiked,
    this.isBookmarked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    excerpt: json["excerpt"],
    content: json["content"],
    featuredImage: json["featured_image"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    categories:
        json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
    readTime: json["read_time"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    likeCount: json["like_count"],
    commentCount: json["comment_count"],
    isLiked: json["is_liked"],
    isBookmarked: json["is_bookmarked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "excerpt": excerpt,
    "content": content,
    "featured_image": featuredImage,
    "author": author?.toJson(),
    "categories":
        categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "read_time": readTime,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "like_count": likeCount,
    "comment_count": commentCount,
    "is_liked": isLiked,
    "is_bookmarked": isBookmarked,
  };
}

class Author {
  int? id;
  Name? name;
  String? avatar;

  Author({this.id, this.name, this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "avatar": avatar,
  };
}

enum Name { NAYEMALAM110 }

final nameValues = EnumValues({"nayemalam110": Name.NAYEMALAM110});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
