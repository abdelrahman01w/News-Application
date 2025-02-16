import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project_ff/home_screen/category/category_details.dart';
import 'package:news_project_ff/home_screen/category/category_fragment.dart';
import 'package:news_project_ff/home_screen/setting/settings.dart';
import 'package:news_project_ff/home_screen/tabs/tab_widget.dart';
import 'package:news_project_ff/model/category.dart';

import '../app_colors.dart';
import '../model/api_manager.dart';
import 'drawer/home_drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName='layout';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/backGroundAPP.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
          ),
          appBar: AppBar(
            title: Text(
              selectedSideMenuItem ==HomeDrawer.setting ? 'Settings' :
              selectedCategory == null ?
              'News App' :selectedCategory!.id
              ,style: Theme.of(context).textTheme.titleLarge,),
          ),

          body:selectedSideMenuItem ==HomeDrawer.setting ?
              SettingsTab()
          :
          selectedCategory == null ?
          CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
          CategoryDetails(category: selectedCategory!,),
        )
      ],
    );
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
