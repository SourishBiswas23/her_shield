import 'package:flutter/material.dart';
import 'package:hackathon_project/app_theme.dart';
import 'package:hackathon_project/views/home_screen/app_banner.dart';

import 'app_drawer_data.data.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const AppBanner(),
          ListView.builder(
            itemCount: appDrawerData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                appDrawerData[index]['callback'](context);
              },
              child: ListTile(
                leading: Icon(
                  appDrawerData[index]['icons'],
                  color: AppTheme.secondaryColor,
                ),
                title: Text(appDrawerData[index]['title'] ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
