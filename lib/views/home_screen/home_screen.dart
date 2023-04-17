import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/page_changer_bloc/page_changer_bloc.dart';
import 'app_drawer.dart';
import 'home_screen_grid_builder.dart';
import 'home_screen_sos_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageChangerBloc pageChangerBloc = context.read<PageChangerBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pageChangerBloc.add(LoadTipOfTheDayEvent());
            },
            icon: Icon(
              Icons.lightbulb,
              color: Colors.amber.shade700,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: HomeScreenGridBuilder(
          pageChangerBloc: pageChangerBloc,
        ),
      ),
      floatingActionButton: const HomeScreenSosButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
