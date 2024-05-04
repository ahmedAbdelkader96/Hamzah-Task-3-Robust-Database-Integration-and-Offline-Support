import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task3/features/main_view/models/article.dart';
import 'package:task3/features/main_view/widgets/article_appbar.dart';
import 'package:task3/global/methods_helpers_utlis/constants.dart';


class ArticleDetail extends StatefulWidget{
  const ArticleDetail({super.key , required this.article});
  final Article article;


  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    String? imageUrl = Constants.defaultImage;
    if (widget.article.media!.isNotEmpty &&
        widget.article.media!.first.mediaMetadata!.isNotEmpty &&
        widget.article.media!.first.mediaMetadata!.length > 2) {
      imageUrl = widget.article.media!.first.mediaMetadata![2].url;
    }

   return Scaffold(
     appBar: ArticleAppbar(context).createBaseAppbar("${widget.article.title}"),
     body: Column(
       children: [
         CachedNetworkImage(
           imageUrl: imageUrl!,
           fit: BoxFit.contain,
           placeholder: (context, url) => Shimmer.fromColors(
             baseColor: Colors.grey[400]!,
             highlightColor: Colors.grey[100]!,
             child: Container(
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   bottomRight: Radius.circular(50.0),
                   bottomLeft: Radius.circular(50.0),
                   topLeft: Radius.circular(50.0),
                   topRight: Radius.circular(50.0),
                 ),
               ),

             ),
           ),
           errorWidget: (context, url, error) => const Icon(Icons.error,),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("${widget.article.articlesListAbstract}",
           ),
         ),




       ],
     ),
   );
  }
}