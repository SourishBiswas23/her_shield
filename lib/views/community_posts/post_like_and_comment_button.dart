import 'package:flutter/material.dart';

class PostLikeAndCommentButton extends StatelessWidget {
  const PostLikeAndCommentButton({
    super.key,
    required this.likeCount,
    required this.commentCount,
  });
  final int likeCount;
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                onPressed: () => print('Liked'),
                icon: likeCount == 0
                    ? Icon(
                        Icons.favorite,
                        color: theme.primaryColor,
                      )
                    : const Icon(Icons.favorite_outline),
              ),
              Text(likeCount.toString()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                onPressed: () => print('Comment'),
                icon: const Icon(Icons.comment_outlined),
              ),
              Text(commentCount.toString()),
            ],
          ),
        )
      ],
    );
    ;
  }
}
