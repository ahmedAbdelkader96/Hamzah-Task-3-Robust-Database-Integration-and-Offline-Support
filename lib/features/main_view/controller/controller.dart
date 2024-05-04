import 'package:task3/features/main_view/models/most_popular_list.dart';
import 'package:task3/features/main_view/repository/repository.dart';

class MainViewController {
  final repo = MainViewRepository();

  Future<MostPopularList?> getArticleListRes() {
    return repo.getArticleListRes();
  }
}
