import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:news_project_ff/app_colors.dart';

class Category{
  String id ;
  String imagePath;
  String title;
  Color color;
  Category({required this.title , required this.color
  ,required this.id , required this.imagePath});
  static List<Category> getcategories(){
    return [
      /*
 business entertainment general health science sports technology
       */
      Category(title: 'Business', color: AppColors.darkBlueColor,
          id: 'business', imagePath: 'assets/bussines.png')
      ,Category(title: 'Environment', color: AppColors.darkBlueColor,
          id: 'entertainment', imagePath: 'assets/environment.png'),
      Category(title: 'general', color: AppColors.darkBlueColor,
          id: 'general', imagePath: 'assets/environment.png')
      ,Category(title: 'Health', color: AppColors.redColor,
          id: 'health', imagePath: 'assets/health.png')
      ,Category(title: 'Science', color: AppColors.yellowColor,
          id: 'science', imagePath: 'assets/science.png')
      ,Category(title: 'Sports', color: AppColors.orangeColor,
          id: 'sports', imagePath: 'assets/sports.png')
      ,Category(title: 'Technology', color: AppColors.primaryColor,
          id: 'technology', imagePath: 'assets/Politics.png')

    ];
  }
}