

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'ArticleWidget/ArticleBloc.dart';
import 'ArticleWidget/ArticleList.dart';
import 'ArticleWidget/Article_model.dart';
import 'appbar.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
        home: BlocProvider(
            create: (context) => ArticleBloc()..add(FetchArticles()),
            child: ArticleScreen()
        )
    );
  }
}

class ArticleScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Articles")),
        body: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state){
              if (state is ArticleLoading){
                return Center(child: CircularProgressIndicator(),);
                // return const SkeletonList extends statelessWidget();
              } else if (state is ArticleLoaded){
                List<Article> articles = state.article;
                return ArticleList(articles: articles);
              } else if (state is ArticleError) {
                return Center(child: Text(state.error));
              }
              return const Center(child: Text("Press button to fetch Articles"));
            })
    );
  }
}

