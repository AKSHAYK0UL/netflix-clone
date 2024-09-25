part of 'movie_bloc.dart';

sealed class MovieEvent {}

final class MovieInitialEvent extends MovieEvent {}

final class FetchDataEvent extends MovieEvent {}

final class SearchDataEvent extends MovieEvent {
  final String query;
  SearchDataEvent({required this.query});
}
