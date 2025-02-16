import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project_ff/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int setting =2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [
        Container(width: double.infinity,
            height: MediaQuery.of(context).size.height*0.05
         , color: AppColors.primaryColor,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.1,
          color: AppColors.primaryColor,
          child: Text('News App!',
          textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),
          )
           ,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(children: [
              Icon(Icons.list,color: AppColors.blackColor,size: 35,),
              SizedBox(width: 10,),
              Text('Categories')
            ],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(setting);
            },
            child: Row(children: [
              Icon(Icons.settings,color: AppColors.blackColor,size: 35,),
              SizedBox(width: 10,),
              Text('Setting')
            ],),
          ),
        )
      ],
    ),);
  }
}
