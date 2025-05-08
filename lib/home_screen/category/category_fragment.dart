import 'package:flutter/material.dart';
import 'package:news_project_ff/home_screen/category/category_item.dart';
import 'package:news_project_ff/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList =Category.getcategories();
  Function onCategoryItemClick;
  CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(15)
        ,child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Pick your category \n of interest',
          style:Theme.of(context).textTheme.titleLarge ,)
        ,SizedBox(height: 20,),
        Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
              itemBuilder: (context , index ){
            return InkWell(
              onTap: (){
                onCategoryItemClick(categoriesList[index]);
              },
                child: CategoryItem(category: categoriesList[index]));
              },
          itemCount: categoriesList.length,),
        )
      ],
    ),);
  }
}
