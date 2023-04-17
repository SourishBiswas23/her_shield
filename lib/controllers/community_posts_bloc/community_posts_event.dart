part of 'community_posts_bloc.dart';

@immutable
abstract class CommunityPostsEvent {}

class CreateNewPost extends CommunityPostsEvent {
  CreateNewPost({required this.content});
  final String content;
  final userName = 'Himanshu';
  final bool isLiked = false;
  final int likeCount = 0;
  final int commentCount = 0;
}

class LoadAllPosts extends CommunityPostsEvent {}
