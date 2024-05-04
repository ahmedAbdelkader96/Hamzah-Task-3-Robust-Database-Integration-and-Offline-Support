import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/main_view/bloc/main_view_bloc.dart';
import 'package:task3/features/main_view/controller/controller.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<MainViewBloc>(
        create: (_) => MainViewBloc(MainViewController())),
  ];
}
