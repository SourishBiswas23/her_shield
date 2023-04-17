import 'package:flutter/material.dart';

import 'delete_post_popup.dart';
import 'edit_post_popup.dart';

class PostTitleAndOptionsButton extends StatelessWidget {
  const PostTitleAndOptionsButton({
    super.key,
    required this.postTitle,
  });

  final String postTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          postTitle,
          style: theme.textTheme.headlineMedium,
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'editPost',
                child: Text('Edit Post'),
              ),
              const PopupMenuItem(
                value: 'deletePost',
                child: Text('Delete Post'),
              )
            ];
          },
          onSelected: (value) {
            if (value == 'editPost') {
              showDialog(
                context: context,
                builder: (context) {
                  return const EditPostPopup();
                },
              );
            } else if (value == 'deletePost') {
              showDialog(
                context: context,
                builder: (context) {
                  return const DeletePostPopup();
                },
              );
            } else {
              throw Exception('Invalid Option');
            }
          },
        )
      ],
    );
  }
}
