import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/movie_bloc.dart';
import 'package:netflix/ui/home/screens/homescreen.dart';
import 'package:netflix/ui/search/screens/searchscreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _screens = [const HomeScreen(), const SearchScreen()];
  @override
  Widget build(BuildContext context) {
    final currentState = context.read<MovieBloc>().state;
    if (_currentIndex == 0 && currentState.runtimeType != MoviesDataState) {
      context.read<MovieBloc>().add(FetchDataEvent());
    }
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        elevation: 20,
        onTap: (value) {
          setState(
            () {
              _currentIndex = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    ));
  }
}
