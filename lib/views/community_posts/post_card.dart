import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/post_model.dart';

import 'post_like_and_comment_button.dart';
import 'post_title_and_popup_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.postModel, required this.isEven});

  final PostModel postModel;
  final bool isEven;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isEven ? Colors.grey[100] : Colors.pink[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostTitleAndOptionsButton(postTitle: postModel.postTitle),
          const SizedBox(
            height: 10,
          ),
          Text(
            postModel.postData,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          PostLikeAndCommentButton(
            commentCount: postModel.commentCount,
            likeCount: postModel.likesCount,
          ),
        ],
      ),
    );
  }
}
