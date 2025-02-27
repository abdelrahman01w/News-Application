import 'package:flutter/material.dart';
import 'package:news_project_ff/model/NewsResponse.dart';
import 'package:news_project_ff/model/api_manager.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  String? errorMessage;
  List<News>? newsList;
  void getNewsBySourceId(String categoryId) async{
    newsList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response = await ApiManager.getNewsBySourceId(sourceId: categoryId);
      if(response?.status == 'null'){
        errorMessage =response!.message;
      }else{
        newsList = response!.articles;
      }
    }catch(e){
      errorMessage = 'Error Loading News List.';
    }
    notifyListeners();
}
}