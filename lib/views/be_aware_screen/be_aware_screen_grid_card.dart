import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../utils/cached_image.dart';

class BeAwareScreenGridCard extends StatelessWidget {
  const BeAwareScreenGridCard({
    super.key,
    required this.gridCardData,
    // required this.pageChangerBloc,
  });
  final Map<String, dynamic> gridCardData;
  // final PageChangerBloc pageChangerBloc;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      // onTap: () {
      //   pageChangerBloc.add(
      //     gridCardData['eventName'],
      //   );
      // },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: CachedImage(imagePath: gridCardData['imagePath']),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: double.infinity,
              height: 30,
              child: Center(
                child: Text(
                  gridCardData['label'],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
