import 'package:dio/dio.dart';
import 'package:inshorts/article.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://inshorts.deta.dev/news?category=science';
  Future<List<NewsArticle>?> getArticles() async {
    List<NewsArticle>? articles;
    try {
      Response articleData = await _dio.get(_baseUrl);
      print(articleData);
      print('Article Info: ${articleData.data["data"]}');
      articles = articleData.data["data"].map<NewsArticle>((article) {
        return NewsArticle.fromMap(article);
      }).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return articles;
  }
}
