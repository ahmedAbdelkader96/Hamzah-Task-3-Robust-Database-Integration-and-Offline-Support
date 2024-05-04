part of 'main_view_bloc.dart';

abstract class MainViewState extends Equatable {
  const MainViewState();
}

// crud states for all users
class MainViewInitialState extends MainViewState {
  @override
  List<Object> get props => [];
}

class LoadingToFetchArticlesState extends MainViewState {
  @override
  List<Object> get props => [];
}

class DoneToFetchArticlesState extends MainViewState {
  final MostPopularList mostPopularList;

  const DoneToFetchArticlesState({required this.mostPopularList});

  @override
  List<Object> get props => [];
}

class ErrorToFetchArticlesState extends MainViewState {
  final String message;

  const ErrorToFetchArticlesState({required this.message});

  @override
  List<Object> get props => [];
}
