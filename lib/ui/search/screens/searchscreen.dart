import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/movie_bloc.dart';
import 'package:netflix/ui/home/widgets/showall.dart';
import 'package:netflix/ui/search/widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: screenSize.height * 0.0264,
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          buildSearchbar(context),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SearchResultData) {
                  return buildShowAll(
                      context: context, data: state.result, title: "search");
                }
                if (state is ErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  );
                }
                return SizedBox(
                  child: Center(
                    child: Text(
                      "Search your favorite shows and more",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
