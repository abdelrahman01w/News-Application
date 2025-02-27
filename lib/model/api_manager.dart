import 'dart:convert';
import 'package:http/http.dart' as http;
import 'NewsResponse.dart';
import 'SourceResponse.dart';
import 'api_constant.dart';
class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 */
  static  Future<SourceResponse?> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstant.baseUrl , ApiConstant.sourceApi,
        {
          'apiKey':'64e4eec66502400b8fc4719e60c961ea',
          'category':categoryId
        });
    var response = await http.get(url);
    try{ //we used try and catch because errors from user like loading or bad network
      var responseBody =response.body; // we know from PostMan that the response in body
      var json = jsonDecode(responseBody); // responseBody is string and we want convert it to Json
      return SourceResponse.fromJson(json);//we will convert json to object
      /// we can summarize the last 3 lines in :
      /// SourceResponse.fromJson(jsonDecode(responseBody));
    }catch(e){
      throw e;
    }
  }
/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=64e4eec66502400b8fc4719e60c961ea
 */
  static Future<NewsResponse?> getNewsBySourceId(
      {String? sourceId, String? quary})async{
    Uri url = Uri.https(ApiConstant.baseUrl ,ApiConstant.sourceNews , {
      'apiKey': ApiConstant.apiKey,
      'sources':sourceId
      ,'q':quary
    });
    var response  = await http.get(url);
    try{
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}