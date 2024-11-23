import 'dart:convert';
import 'dart:math';

import 'package:first_app/ArticleWidget/ArticleTile.dart';
import 'package:first_app/ArticleWidget/Article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ArticleList extends StatelessWidget{
  final List<Article> articles;
  ArticleList({required this.articles});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (c, index){
              Article article = articles[index];
              return  ArticleTile(article: article);
            })
          // return Center(child: CircularProgressIndicator(),);
        ));
  }
}

