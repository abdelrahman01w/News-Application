import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../model/NewsResponse.dart';
import '../../model/api_manager.dart';
import '../news/news_item.dart';

class SearchTap extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
        showSuggestions(context);
      }, icon: Icon(Icons.clear)),
      IconButton(onPressed : (){
        showResults(context);
      },icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return
     FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(quary: query),
        builder: (context , snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){ // if the data is load
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),);
          }
          else if(snapshot.hasError){ // if the error from client
            return Column(children: [
              Text("something went error"),
              ElevatedButton(onPressed: (){
                ///ApiManager.getSources();

              }, child: Text("try again"))
            ],);
          }
          if(snapshot.data!.status! != 'ok'){
            return Column(children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
                ///ApiManager.getSources();

              }, child: Text("try again"))
            ],);
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context , index){
            return NewsItem(news: newsList[index]);
          }
            ,itemCount: newsList.length,);
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text(" Enter text to search"
      ,style: Theme.of(context).textTheme.titleLarge,),);
    }
    return
      FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(quary: query),
        builder: (context , snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){ // if the data is load
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),);
          }
          else if(snapshot.hasError){ // if the error from client
            return Column(children: [
              Text("something went error"),
              ElevatedButton(onPressed: (){
                ///ApiManager.getSources();

              }, child: Text("try again"))
            ],);
          }
          if(snapshot.data!.status! != 'ok'){
            return Column(children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
                ///ApiManager.getSources();

              }, child: Text("try again"))
            ],);
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context , index){
            return NewsItem(news: newsList[index]);
          }
            ,itemCount: newsList.length,);
        }
    );
  }
  
}