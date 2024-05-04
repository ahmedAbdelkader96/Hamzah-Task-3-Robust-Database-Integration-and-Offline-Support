import 'package:flutter/material.dart';


class ArticleAppbar {
  final BuildContext context;
  ArticleAppbar(this.context);
  AppBar createBaseAppbar(String title) {
    return AppBar(
      // elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.greenAccent.shade200,
      leading: IconButton(onPressed: (){Navigator.pop(context);},icon: const Icon(Icons.arrow_back_ios_sharp),),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400),),

    );
  }
}