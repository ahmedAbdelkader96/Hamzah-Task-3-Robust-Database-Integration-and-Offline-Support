part of 'main_view_bloc.dart';

@immutable
abstract class MainViewEvent extends Equatable {
  const MainViewEvent();
}

class FetchArticles extends MainViewEvent {
  @override
  List<Object?> get props => [];
}
