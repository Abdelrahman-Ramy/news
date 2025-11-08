import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_constant.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=54b623f608a14c319c0fcd77d99bcff6

  static Future<SourceResponse?> getSources(String categoryId) async{
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourceApi,
        {'apiKey':ApiConstant.apiKey,
         'category':categoryId});
    var response = await http.get(url);

    try{
      // parsing
      var responseBody = response.body;   // String
      var json = jsonDecode(responseBody);   // json
      return SourceResponse.fromJson(json);      // SourceResponse
      // SourceResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }

  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=54b623f608a14c319c0fcd77d99bcff6

   static Future<NewsResponse> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsApi,
        {'apiKey' : ApiConstant.apiKey,
          'sources' : sourceId
        });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
   }

}
