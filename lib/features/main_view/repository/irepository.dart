


import 'package:task3/features/main_view/models/most_popular_list.dart';

abstract class IMainViewRepository {

  Future<MostPopularList?> getArticleListRes();
}
