import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?apiKey=c8d51b5f00154230b79852b55f5434fb&country=us&category=$category",
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article["urlToImage"],
          title: article["title"],
          subTitle: article["description"],
          url: article["url"], // <-- store the article link
        );
        articleList.add(articleModel);
      }

      return articleList;
    } catch (e) {
      return [];
    }
  }
}
