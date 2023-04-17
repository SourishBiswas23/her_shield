import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'pink_dot.dart';

List<Widget> permissionListBuilder({
  required List<Map<String, dynamic>> permissionList,
  required ThemeData theme,
}) {
  return permissionList
      .map(
        (permissionData) => permissionNameIconAndDescription(
          permissionData: permissionData,
          theme: theme,
        ),
      )
      .toList();
}

Widget permissionNameIconAndDescription({
  required Map<String, dynamic> permissionData,
  required ThemeData theme,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              permissionData['icon'],
              color: AppTheme.textColor2,
            ),
            const SizedBox(width: 10),
            Text(
              permissionData['label'],
              style: theme.textTheme.bodyLarge,
            )
          ],
        ),
        ...(permissionData['description'] as List)
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 30),
                    const PinkDot(),
                    const SizedBox(width: 5),
                    Text(
                      entry,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    ),
  );
}

final List<Map<String, dynamic>> iconLabelPair = [
  {
    'icon': Icons.person_outline,
    'label': 'Identity',
    'description': [
      'Links the app with your Aadhar Identity',
      'Access your contacts'
    ]
  },
  {
    'icon': Icons.camera_alt_outlined,
    'label': 'Camera, Voice Record',
    'description': [
      'Take pictures and videos',
      'Take voice recording clips',
    ]
  },
  {
    'icon': Icons.sms_outlined,
    'label': 'SMS',
    'description': [
      'Read your text messages (SMS or MMS)',
      'Access your contacts',
    ]
  },
  {
    'icon': Icons.location_on_outlined,
    'label': 'Location',
    'description': [
      'Track your precise Location',
      'Send Location to your contacts',
    ]
  },
];
