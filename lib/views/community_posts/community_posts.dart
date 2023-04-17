import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/utils/community_posts_services.dart';
import 'package:hackathon_project/views/community_posts/create_post.dart';

import '../../controllers/community_posts_bloc/community_posts_bloc.dart';
import 'post_card.dart';

class CommunityPosts extends StatelessWidget {
  const CommunityPosts({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final CommunityPostsBloc communityPostsBloc =
        context.read<CommunityPostsBloc>();
    communityPostsBloc.add(LoadAllPosts());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community Posts',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Center(
          child: BlocBuilder<CommunityPostsBloc, CommunityPostsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    postModel: state.posts[index],
                    isEven: index % 2 == 0,
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const CreatePost();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
