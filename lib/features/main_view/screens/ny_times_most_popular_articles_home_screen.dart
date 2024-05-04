import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/main_view/bloc/main_view_bloc.dart';
import 'package:task3/features/main_view/models/most_popular_list.dart';
import 'package:task3/features/main_view/widgets/ny_appbar.dart';
import 'package:task3/global/methods_helpers_utlis/local_storage_helper.dart';
import 'package:task3/global/methods_helpers_utlis/toast.dart';

import '../widgets/ny_articles_list.dart';

class NyTimesMostPopularArticlesHomeScreen extends StatefulWidget{
  final String title;
  const NyTimesMostPopularArticlesHomeScreen({required this.title,super.key});

  @override
  State<NyTimesMostPopularArticlesHomeScreen> createState() => _NyTimesMostPopularArticlesHomeScreenState();
}

class _NyTimesMostPopularArticlesHomeScreenState extends State<NyTimesMostPopularArticlesHomeScreen>
    with WidgetsBindingObserver{


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initMostPopular();
  }

  MostPopularList? savedMostPopularList ;
  Future<void> initMostPopular()async{
    context.read<MainViewBloc>().add(FetchArticles());
    String mostPopular =  await LocalStorageHelper.getString('mostPopular') ?? "";
    if(mostPopular.isNotEmpty){
      savedMostPopularList =
          MostPopularList.fromJson(jsonDecode(mostPopular) as Map<String, dynamic>);
      setState(() {});
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      initMostPopular();
    }
  }


  @override
  Widget build(BuildContext context) {
     return
       Scaffold(
         appBar: NyAppBar(context).createBaseAppbar(widget.title),
         body: Center(
           child: BlocConsumer<MainViewBloc, MainViewState>(
             listener: (context, state) {
               if (state is ErrorToFetchArticlesState) {
                 ToastClass.toast(
                     context: context, data: state.message, seconds: 3);
                 log(state.message);
               }


             },
             builder: (context, state) {

               if(state is DoneToFetchArticlesState){
                 return NyArticlesList(articles: state.mostPopularList.articles,);

               }


               if(state is ErrorToFetchArticlesState){
                 return Text(state.message);
               }


               if(savedMostPopularList != null){
                 return NyArticlesList(articles: savedMostPopularList!.articles,);
               }
               return const CircularProgressIndicator();

             },
           ),
         ),
       )
       ;


  }



}