import 'dart:math';

import 'package:first_app/ArticleWidget/ArticleExpanded.dart';
import 'package:first_app/ArticleWidget/Article_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleTile extends StatefulWidget {
  final Article article;
  ArticleTile({required this.article});

  State<StatefulWidget> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    Article? article = widget.article;
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(15),
      // ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        child: InkWell(
          onTap: () {
                  showModalBottomSheet(context: context, isScrollControlled: true, builder: (BuildContext context) {
                    return ArticleExpanded(article: article,);
                  });
                },
          child: Container(
            child: ListTile(
              title: Text(article.title ?? "Unknown Title",
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.author ?? "Unknown Author"),
                  Text(DateFormat("yyyy-MM-dd")
                      .format(DateTime.parse(article.publishedAt ?? "Unknown Date"))),
                ],
              ),
              leading:Image(image: NetworkImage(article.urlToImage.toString()), height: 100, width: 100, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.broken_image, size: 50,),),
                ),
            ),),
          ),
        ),
      );
  }
}
