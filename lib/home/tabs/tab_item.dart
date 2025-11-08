import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

import '../../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected ;
  Source source;
  TabItem({required this.isSelected, required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? AppColors.primaryLightColor : AppColors.whiteColor,
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 2
        )
      ),
      child: Text(source.name ?? "",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: isSelected ? AppColors.whiteColor : AppColors.primaryLightColor
        ),
      ),
    );
  }
}
