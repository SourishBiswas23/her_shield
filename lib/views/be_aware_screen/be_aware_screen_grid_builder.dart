import 'package:flutter/material.dart';

import 'be_aware_screen_grid_card.dart';
import 'be_aware_screen_grid_data.dart';

class BeAwareScreenGridBuilder extends StatelessWidget {
  const BeAwareScreenGridBuilder({
    super.key,
    // required this.pageChangerBloc,
  });
  // final PageChangerBloc pageChangerBloc;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: beAwareScreenGridData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => BeAwareScreenGridCard(
        gridCardData: beAwareScreenGridData[index],
        // pageChangerBloc: pageChangerBloc,
      ),
    );
  }
}
