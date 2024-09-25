import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/movie_bloc.dart';
import 'package:netflix/route/routetable.dart';
import 'package:netflix/theme/themedata.dart';
import 'package:netflix/ui/navbar/bottomnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Netflix',
        theme: themeData(context),
        home: const BottomNav(),
        routes: routes,
      ),
    );
  }
}
