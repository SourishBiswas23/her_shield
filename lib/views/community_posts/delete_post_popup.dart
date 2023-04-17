import 'package:flutter/material.dart';

class DeletePostPopup extends StatelessWidget {
  const DeletePostPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Do you really want to delete this post?',
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            print('Post not deleted');
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            print('Post deleted');
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Delete'),
        )
      ],
    );
  }
}
