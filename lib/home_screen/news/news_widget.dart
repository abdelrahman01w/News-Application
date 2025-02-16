import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../app_colors.dart';
import '../../model/NewsResponse.dart';
import '../../model/SourceResponse.dart';
import '../../model/api_manager.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  Sources sources;

  NewsWidget({required this.sources});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.sources.id ?? ""),
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
                setState(() {
                });
              }, child: Text("try again"))
            ],);
          }
          if(snapshot.data!.status! != 'ok'){
            return Column(children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
                ///ApiManager.getSources();
                setState(() {
                });
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
