import 'dart:math';

import 'package:first_app/ArticleWidget/Article_model.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatefulWidget{

  final Article article;
  ArticleTile({required this.article});

  State<StatefulWidget> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile>{
  @override
  Widget build(BuildContext context) {
    Article? article = widget.article;
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
      child: ListTile(
        title: Text(article.title ?? "", maxLines: 2, style: TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,

        )),
        subtitle: Column(
          children: [
            Text("${article.author ?? "Unknown Author"}\n${DateTime.parse(article.publishedAt ?? "")}")
          ],
        ),
        leading: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(article.urlToImage ?? ""),
        ),
      ),
      ),
    );
  }

}