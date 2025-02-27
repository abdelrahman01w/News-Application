import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project_ff/home_screen/news_details/news_details_screen.dart';
import 'package:news_project_ff/model/NewsResponse.dart';

import '../../app_colors.dart';

class  NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25)
            //   ),
            //   child: Image.network(news.urlToImage??""),
            // )
            //or
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(news.urlToImage??"",
                  width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.fill)
            )
            ,SizedBox(height: 8,)
            ,Text(news.author ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),),
      SizedBox(height: 8,),
            Text(news.title ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor)),
      SizedBox(height: 8,),
            Text(news.publishedAt ?? '',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),textAlign: TextAlign.end,)
          ],
        ),
      ),
    );
  }
}
