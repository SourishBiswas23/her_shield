class CommunityPostModel {
  CommunityPostModel({
    required this.userName,
    required this.content,
    required this.isLiked,
    required this.likeCount,
    required this.commentCount,
    required this.userId,
  });
  final String userName;
  final String content;
  final bool isLiked;
  final int likeCount;
  final int commentCount;
  final String userId;
}
