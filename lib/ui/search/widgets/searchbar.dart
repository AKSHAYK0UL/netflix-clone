import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/movie_bloc.dart';

Widget buildSearchbar(BuildContext context) {
  final screenSize = MediaQuery.sizeOf(context);

  return Container(
    height: screenSize.height * 0.0858,
    margin: EdgeInsets.symmetric(
        horizontal: screenSize.height * 0.0198,
        vertical: screenSize.height * 0.0066),
    child: TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01716,
            horizontal: screenSize.height * 0.033),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenSize.height * 0.03432),
          borderSide: const BorderSide(color: Colors.white, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenSize.height * 0.03432),
          borderSide: const BorderSide(color: Colors.white, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenSize.height * 0.03432),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.red,
          size: screenSize.height * 0.03744,
        ),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<MovieBloc>().add(SearchDataEvent(query: value));
        } else {
          context.read<MovieBloc>().add(MovieInitialEvent());
        }
      },
    ),
  );
}
