part of 'community_posts_bloc.dart';

@immutable
abstract class CommunityPostsState {
  final List<PostModel> posts = [];
}

class CommunityPostsInitial extends CommunityPostsState {
  @override
  final List<PostModel> posts = [];
}

class CommunityPostsMessages extends CommunityPostsState {
  CommunityPostsMessages({required this.posts});
  @override
  final List<PostModel> posts;
}
