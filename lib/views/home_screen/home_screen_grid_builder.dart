import 'package:flutter/material.dart';
import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';

import 'home_screen_grid_card.dart';
import 'home_screen_grid_data.data.dart';

class HomeScreenGridBuilder extends StatefulWidget {
  const HomeScreenGridBuilder({
    super.key,
    required this.pageChangerBloc,
  });
  final PageChangerBloc pageChangerBloc;

  @override
  State<HomeScreenGridBuilder> createState() => _HomeScreenGridBuilderState();
}

class _HomeScreenGridBuilderState extends State<HomeScreenGridBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: homeScreenGridData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => HomeScreenGridCard(
        gridCardData: homeScreenGridData[index],
        pageChangerBloc: widget.pageChangerBloc,
      ),
    );
  }
}
