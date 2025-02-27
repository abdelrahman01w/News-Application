import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_colors.dart';
import '../../model/NewsResponse.dart';
import '../../model/category.dart';
import '../drawer/home_drawer.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key});
  static const String routeName="NewsDetailsScreen";

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var news =ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedSideMenuItem ==HomeDrawer.setting ? 'Settings' :
          selectedCategory == null ?
          'News App' :selectedCategory!.id
          ,style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Container(
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
            Text(news.publishedAt!.substring(0,10) ?? '',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),textAlign: TextAlign.end,),
            SizedBox(height: 8,),
            Text(news.content ?? '',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),textAlign: TextAlign.end,)
            ,SizedBox(height: 50,),
            InkWell(
              onTap: (){
                _launchUrl(news.url??"");
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("View Full Article ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),
                      textAlign: TextAlign.end,),
                    Icon(Icons.arrow_forward_ios_sharp,color: AppColors.blackColor,)
                  ],
                ))

          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  Category? selectedCategory;
  void onCategoryItemClick(Category newCategory){
    selectedCategory =newCategory ;
    setState(() {

    });
  }
  int selectedSideMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSideMenuItem){
    selectedSideMenuItem=newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
