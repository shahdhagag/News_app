class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? url;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.url,
  });

  @override
  String toString() {
    return 'Title: $title\nSubTitle: $subTitle\nImage: $image\nURL: $url';
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? 'No title',
      subTitle: json['description'] ?? '',
      image: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
