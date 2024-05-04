

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task3/features/main_view/models/most_popular_list.dart';
import 'package:task3/features/main_view/repository/irepository.dart';

class MainViewRepository implements IMainViewRepository {





  @override
  Future<MostPopularList?> getArticleListRes() async {
    final endPoint = dotenv.env['mostPopularNYtimesApi'].toString();

    var dio = Dio();
    try {
      var response = await dio.get(endPoint,);
      if(response.statusCode ==200){
        var  json = response.data;
        MostPopularList mostPopularList = MostPopularList.fromJson(json);
        return mostPopularList;
      }else{
        return null;
      }


    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }



}
