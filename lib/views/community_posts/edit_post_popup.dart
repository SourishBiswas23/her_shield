import 'package:flutter/material.dart';

class EditPostPopup extends StatelessWidget {
  const EditPostPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit"),
      content: const TextField(
        maxLines: null,
        decoration: InputDecoration(
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
            print('Edited Post');
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        )
      ],
    );
  }
}
