import 'package:flutter/cupertino.dart';
import 'package:news_project_ff/model/SourceResponse.dart';
import 'package:news_project_ff/model/api_manager.dart';

class CategoryViewModel extends ChangeNotifier {
  /// hold data - handle logic
  List<Sources>? sourceList;
  String ? errorMessage;
  void getSources(String categoryId) async{
    sourceList =null ;
    errorMessage = null;
    notifyListeners();
    try{
      var response =  await ApiManager.getSources(categoryId);
      if(response?.status == 'error'){
       errorMessage = response!.message;
      }else{
        sourceList =response!.sources;
      }
    }catch(e){
       errorMessage = 'Error loading source list';
    }
    notifyListeners();
  }
}