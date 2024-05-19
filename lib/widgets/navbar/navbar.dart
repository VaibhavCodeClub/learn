import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/cubit/index_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, int>(
      builder: (context, index) {
        final currentPageIndex = index;
        return NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (index) {
            context.read<IndexCubit>().changeIndex(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded),
              label: "Explore",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_rounded),
              label: "Favorite",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: "About",
            ),
          ],
        );
      },
    );
  }
}
