import 'package:bloc/bloc.dart';
import 'package:hackathon_project/data/models/post_model.dart';
import 'package:hackathon_project/utils/community_posts_services.dart';
import 'package:meta/meta.dart';

part 'community_posts_event.dart';
part 'community_posts_state.dart';

class CommunityPostsBloc
    extends Bloc<CommunityPostsEvent, CommunityPostsState> {
  CommunityPostsBloc() : super(CommunityPostsInitial()) {
    on<CreateNewPost>((event, emit) {
      print(event.content);
      // final newPost = {
      //   'userName': event.userName,
      //   'content': event.content,
      //   'isLiked': event.isLiked,
      //   'likeCount': event.likeCount,
      //   'commentCount': event.commentCount,
      // };
      // emit(CommunityPostsMessages(posts: [newPost, ...state.posts]));
    });
    on<LoadAllPosts>((event, emit) async {
      final allPosts = await _communityPostsServices.getAllPosts();
      emit(CommunityPostsMessages(posts: allPosts));
    });
  }
  final CommunityPostsServices _communityPostsServices =
      CommunityPostsServices();
}
