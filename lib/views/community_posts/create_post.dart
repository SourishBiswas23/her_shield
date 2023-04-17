import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/app_theme.dart';
import 'package:hackathon_project/controllers/community_posts_bloc/community_posts_bloc.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late final TextEditingController _postContentController;

  @override
  void initState() {
    _postContentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _postContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommunityPostsBloc communityPostsBloc =
        context.read<CommunityPostsBloc>();

    return AlertDialog(
      title: const Text("Edit"),
      content: TextField(
        controller: _postContentController,
        maxLines: null,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            print(_postContentController.text);
            communityPostsBloc.add(CreateNewPost(
              content: _postContentController.text,
            ));
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
          ),
          child: const Text('Create'),
        ),
        ElevatedButton(
          onPressed: () {
            print('Post not Created');
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.secondaryColor,
          ),
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
