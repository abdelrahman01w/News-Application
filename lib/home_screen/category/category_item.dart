import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project_ff/app_colors.dart';
import 'package:news_project_ff/model/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(25),
          bottomRight:Radius.circular(25) ,
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath,height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),)
        ],
      ),
    );
  }
}
