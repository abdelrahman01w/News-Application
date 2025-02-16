import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../model/api_manager.dart';
import '../tabs/tab_widget.dart';
import 'package:news_project_ff/model/category.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( // we used it because the responseBody is future and we can handle errors by it
        future: ApiManager.getSources(widget.category.id),// call function that will return data
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){ // if the data is load
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),);
          }
          else if(snapshot.hasError){ // if the error from client
            return Column(children: [
              Text("something went error"),
              ElevatedButton(onPressed: (){
                ApiManager.getSources(widget.category.id);
                setState(() {
                });
              }, child: Text("try again"))
            ],);
          }
          if(snapshot.data!.status! != 'ok'){// if the error from server by status from post man like error 404
            return Column(children: [
              Text(snapshot.data!.message!), // display the error message from server
              ElevatedButton(onPressed: (){
                ApiManager.getSources(widget.category.id);
                setState(() {
                });
              }, child: Text("try again"))
            ],);
          }
          // if the data is success
          var sourceList=snapshot.data!.sources!;
          return TabWidget(sourcesList: sourceList ,);
        });
  }
}
