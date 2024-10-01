
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewList extends StatefulWidget{

  const NewList({super.key});

  @override
  State<NewList> createState() => _NewListState();
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

  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id' : id,
  //
  //   }
  // }

}

class _NewListState extends State<NewList>{



  Future<List<Post>> fetchAllPosts() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.org/posts"));
    if(response.statusCode == 200){
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();

    }
    else throw Exception("Failed to load posts");
  }

  @override
  Widget build(BuildContext context) {

    Future<List<Post>> posts = fetchAllPosts();
    print(posts.toString());
    // List<String> myProducts = ["hello", "hi"];
    // for (int i = 0; i < 100; i++)
    //   myProducts.add("hi" + i.toString());

    return Scaffold(
        body: Center(
          child: FutureBuilder(future: fetchAllPosts(), builder: (context, snap){
            if (snap.hasData){
              return
                ListView.builder(
                // the number of items in the list
                  itemCount: snap.data?.length,

                  // display each item of the product list
                  itemBuilder: (context, index) {
                    return Card(
                      // In many cases, the key isn't mandatory
                      key: ValueKey(snap.data?[index]),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snap.data![index].image),
                        ),
                        title: Text(snap.data![index].title),
                        subtitle: Text((snap.data![index].content), overflow: TextOverflow.ellipsis,),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator(),);
          })
        )
      );
  }


}