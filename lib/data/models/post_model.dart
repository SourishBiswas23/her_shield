class PostModel {
  PostModel({
    required this.postId,
    required this.userId,
    required this.postTitle,
    required this.postData,
    required this.likesCount,
    required this.commentCount,
  });
  final String postId;
  final String userId;
  final String postTitle;
  final String postData;
  final int likesCount;
  final int commentCount;
}
