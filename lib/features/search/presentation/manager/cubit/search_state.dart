part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingStates extends SearchState {}

final class SearchSuccessStates extends SearchState {}

final class SearchErrorStates extends SearchState {}