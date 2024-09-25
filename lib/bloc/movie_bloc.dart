import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/model/response.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final url = "https://api.tvmaze.com/search/shows?q=all";
  MovieBloc() : super(MovieInitial()) {
    on<MovieInitialEvent>(_initialState);
    on<FetchDataEvent>(_fetchData);
    on<SearchDataEvent>(_searchdata);
  }
  void _initialState(MovieInitialEvent event, Emitter<MovieState> emit) {
    emit(MovieInitial());
  }

  Future<void> _fetchData(
      FetchDataEvent event, Emitter<MovieState> emit) async {
    emit(LoadingState());
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body.toString());
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> rawData = json.decode(response.body);
        final List<ShowResponse> data =
            rawData.map((d) => ShowResponse.fromJson(d)).toList();
        emit(
          MoviesDataState(data: data),
        );
      } else {
        emit(ErrorState(error: response.body.toString()));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> _searchdata(
      SearchDataEvent event, Emitter<MovieState> emit) async {
    emit(LoadingState());
    try {
      final response = await http.get(
          Uri.parse("https://api.tvmaze.com/search/shows?q=${event.query}"));
      List<dynamic> rawData = json.decode(response.body);
      final List<ShowResponse> data =
          rawData.map((d) => ShowResponse.fromJson(d)).toList();
      if (response.statusCode == HttpStatus.ok && response.body.isNotEmpty) {
        emit(SearchResultData(result: data));
      } else if (response.statusCode == HttpStatus.ok &&
          response.body.isEmpty) {
        emit(ErrorState(error: "No Data Found!"));
      } else {
        emit(ErrorState(error: response.body.toString()));
      }
    } catch (e) {
      emit(
        ErrorState(
          error: e.toString(),
        ),
      );
    }
  }
}
