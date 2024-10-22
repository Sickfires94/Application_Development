
import 'dart:convert';

import 'package:first_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NewListBuilder extends StatelessWidget{
  const NewListBuilder({super.key});


  // const NewList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    if (context.watch<NewList>().isLoading){
      context.read<NewList>().fetchAllPosts();
      return CircularProgressIndicator();
    }

    return Scaffold(
        body: Center(
          child:ListView.builder(itemBuilder: (c, i){

            var _item = context.watch<NewList>().posts[i];
            return ListTile(title: Text(_item.title), subtitle: Text(_item.content, overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(child: Image.network(_item.image),),);
          }),


        ));
  }
}

class NewList with ChangeNotifier{
  List<Post> _posts = [];
  bool _isloading = true;

  List<Post> get posts => _posts;
  bool get isLoading => _isloading;

  void fetchAllPosts() async{
    try{
      final response = await http.get(Uri.parse("https://jsonplaceholder.org/posts"));
      if(response.statusCode == 200){
        List jsonResponse = jsonDecode(response.body);
        _posts = jsonResponse.map((post) => Post.fromJson(post)).toList();
        _isloading = false;
        print("HJello");
      }
      else throw Exception("Failed to load posts");
    }
    catch(exp){
      throw Exception("Failed to load posts");
    }
    finally{
      notifyListeners();
    }
  }
}

class Post{
 final int id;
 final String slug;
 final String url;
 final String title;
 final String content;
 final String image;
 // final String thumbnail;
 // final String status;
 // final DateTime publishedAt;
 // final DateTime updatedAt;
 // final int userId;

 Post({
   required this.id,
   required this.slug,
   required this.url,
   required this.title,
   required this.content,
   required this.image
 });



  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      slug: json['slug'],
      url: json['url'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
    );
  }
}

class _NewListState with ChangeNotifier{
}