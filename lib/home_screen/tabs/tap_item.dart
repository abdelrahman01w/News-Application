import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../model/SourceResponse.dart';


class TapItem extends StatelessWidget {
  bool isSelected;
  Sources sources;
  TapItem({required this.isSelected,required this.sources});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isSelected ?AppColors.primaryColor : Colors.transparent,
          border: Border.all(
              color: AppColors.primaryColor,
              width: 2
          )

      ),
      child: Text(sources.name ??'',
        style:Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected ?AppColors.whiteColor : AppColors.primaryColor
        ),),
    );
  }
}
