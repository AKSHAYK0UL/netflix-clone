part of 'movie_bloc.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class LoadingState extends MovieState {}

final class ErrorState extends MovieState {
  final String error;
  ErrorState({required this.error});
}

final class MoviesDataState extends MovieState {
  List<ShowResponse> data = [];
  MoviesDataState({required this.data});
}

final class SearchResultData extends MovieState {
  List<ShowResponse> result = [];
  SearchResultData({required this.result});
}
