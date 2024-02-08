class Post {
  final String postedImage;
  final String postId;
  final DateTime updatedAt;

  Post(
      {required this.postedImage,
      required this.postId,
      required this.updatedAt});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postedImage:
          json['posted_imge'] is String ? json['posted_imge'] as String : '',
      postId: json['post_id'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
