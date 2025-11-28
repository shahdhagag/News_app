import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/articles_model.dart';
import '../services/news_services.dart';
import 'NewsListView.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // Future to get the news
  Future<List<ArticleModel>> getGeneralNews() async {
    return await NewsService(Dio()).getNews(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: getGeneralNews(), // call the API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 🔹 Loading state
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // ❌ Error state
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("There was an error. Try again later."),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // ⚠️ Empty data
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("No articles available."),
            ),
          );
        } else {
          // ✅ Data loaded successfully
          List<ArticleModel> articles = snapshot.data!;
          return NewsListView(articles: articles);
        }
      },
    );
  }
}




// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../holder.dart';
// import '../models/articles_model.dart';
// import '../services/news_services.dart';
// import 'NewsListView.dart';
// //import 'news_list_view.dart'; // your sliver list file
//
// class NewsListViewBuilder extends StatefulWidget {
//   const NewsListViewBuilder({super.key});
//
//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
// }
//
// class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
//   List<ArticleModel> articles = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }
//
//   Future<void> getGeneralNews() async {
//     articles = await NewsService(Dio()).getNews();
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//       child: Center(child: CircularProgressIndicator()),
//     )
//         : articles.isNotEmpty
//         ?NewsListView(articles: articles)
//         :SliverToBoxAdapter(child: Text("there was an error,try again later")) ;
//   }
// }
