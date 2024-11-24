import 'dart:convert';

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'Article_model.dart';

abstract class ArticleEvent {}
class FetchArticles extends ArticleEvent{}

abstract class ArticleState{}
class ArticleInitial extends ArticleState{}
class ArticleLoading extends ArticleState{}

class ArticleLoaded extends ArticleState{
  final List<Article> article;
  ArticleLoaded(this.article);
}

class ArticleError extends ArticleState{
  final String error;
  ArticleError(this.error);
}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState>{

  // Should be kept in an .env file but for the sake of demonstration its kept exposed here
  final APIKEY = 'de4c12ea15c4491198f156baaca879ca';

  ArticleBloc() : super(ArticleInitial()){
    on<FetchArticles>(_onFetchArticles);
  }

  Future<void> _onFetchArticles(
      FetchArticles event,
      Emitter<ArticleState> emit,
      ) async {
    emit(ArticleLoading());
    try{
        final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=$APIKEY"));
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          final articles =  (data['articles'] as List).map((article) => Article.fromJson(article)).toList();
          print(articles);
          emit(ArticleLoaded(articles));
      }
      else throw Exception("Failed to load posts");
    }
    catch (e){
      emit(ArticleError('Error: $e'));
    }
  }
}