import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'Article_model.dart';

class ArticleExpanded extends StatelessWidget {

  final Article article;
  ArticleExpanded({required this.article});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(article.title ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          Container(height: 10,),
          Text("by ${article.author ?? "Unknown author"}"),
          Text("published on ${DateFormat("yyyy-MM-dd").format(DateTime.parse(article.publishedAt ?? ""))}"),
          Container(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: NetworkImage(article.urlToImage.toString()), errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),),),
          Container(height: 10,),
          Text(article.description ?? "No Description available", style: TextStyle(fontWeight: FontWeight.bold),),
          Container(height: 10,),
          Text(article.content ?? "No Content available"),
          Container(height: 10,),
          TextButton(onPressed: _launchUrl
            , child: Text("Open Article"))
        ],
      ),
        ),
    );
  }

  Future<void> _launchUrl() async {
    print("parsing url: ${article.url}");
    Uri url = Uri.parse(article.url ?? "https://google.com");
    print("Opening url ${article.url}");
    // if (!await launchUrl(url)) {
    //   throw Exception('Could not launch ${url}');
    // }
  }
}