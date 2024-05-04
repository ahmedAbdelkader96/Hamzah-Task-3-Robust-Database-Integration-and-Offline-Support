import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/main_view/controller/controller.dart';
import 'package:task3/features/main_view/models/most_popular_list.dart';
import 'package:task3/global/methods_helpers_utlis/local_storage_helper.dart';

part 'main_view_event.dart';
part 'main_view_state.dart';

class MainViewBloc extends Bloc<MainViewEvent, MainViewState> {
  final MainViewController mainViewController;

  static MainViewBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  MainViewBloc(this.mainViewController) : super(MainViewInitialState()) {
    on<FetchArticles>((event, emit) async {
      try {
        emit(LoadingToFetchArticlesState());

        MostPopularList? mostPopularList =
            await mainViewController.getArticleListRes();

        if (mostPopularList != null) {
          await LocalStorageHelper.setString(
              'mostPopular', jsonEncode(mostPopularList));
          emit(DoneToFetchArticlesState(mostPopularList: mostPopularList));
        } else {
          emit(const ErrorToFetchArticlesState(message: "Error Occurred!"));
        }
      } catch (error) {
        emit(ErrorToFetchArticlesState(message: error.toString()));
      }
    });
  }
}
