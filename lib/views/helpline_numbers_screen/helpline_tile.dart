import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplineTile extends StatelessWidget {
  const HelplineTile({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            data['name'],
            style: theme.textTheme.bodyLarge,
          ),
          subtitle: Text(
            data['helplineNumber'],
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: GestureDetector(
            onTap: () async {
              await _makePhoneCall(data['helplineNumber']);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Text(
                'Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          enableFeedback: true,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        )
      ],
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
