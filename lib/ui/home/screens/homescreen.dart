import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/movie_bloc.dart';
import 'package:netflix/ui/home/widgets/comingsoon.dart';
import 'package:netflix/ui/home/widgets/buildcategory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MovieBloc>().add(FetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(
          "assets/logo.png",
        ),
        title: Text(
          "NETFLIX",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MoviesDataState) {
            return ListView(
              children: [
                comingSoon(
                  context: context,
                  data: state.data,
                ),
                buildCategory(
                  context: context,
                  data: state.data,
                  title: "Tv Shows",
                  category: "network",
                ),
                buildCategory(
                  context: context,
                  data: state.data,
                  title: "Web Series",
                  category: "webChannel",
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
