import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_services.dart';
import 'news_tile.dart';
class NewsListView extends StatelessWidget {
  const NewsListView({super.key,required this.articles});

 final List<ArticleModel> articles ;

  @override
  Widget build(BuildContext context) {
    return  SliverList(delegate:
    SliverChildBuilderDelegate(
      childCount: articles.length,
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 20
            ),
            child: NewsTile(
              articleModel: articles[index],
            ),
          ),
    )
    );
  }
}
