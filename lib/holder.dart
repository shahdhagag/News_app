// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/models/articles_model.dart';
// import 'package:news_app/services/news_services.dart';
// import 'news_tile.dart';
// class NewsListView extends StatefulWidget {
//   const NewsListView({
//     super.key,
//   });
//
//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }
//
// class _NewsListViewState extends State<NewsListView> {
//   List<ArticleModel> articles =[];
//   bool isLoading=true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     //NewsService(Dio()).getNews();
//     super.initState();
//     getGeneralNews();
//
//   }
//   Future<void> getGeneralNews() async {
//     articles=await NewsService(Dio()).getNews();
//     isLoading=false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  isLoading ? SliverToBoxAdapter(
//         child: Center(
//             child: CircularProgressIndicator()))
//         :SliverList(delegate:
//     SliverChildBuilderDelegate(
//       childCount: articles.length,
//           (context, index) => Padding(
//         padding: const EdgeInsets.only(bottom: 20
//         ),
//         child: NewsTile(
//           articleModel: articles[index],
//         ),
//       ),
//     )
//     );
//   }
// }
