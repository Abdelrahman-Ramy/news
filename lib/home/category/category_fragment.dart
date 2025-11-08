import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/category/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = Category.getCategories();
  Function onCategoryItemClick;
  CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category\n of interest',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.blackColor
          ),),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // no of coulm
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryItemClick(categoryList[index] );
                  },
                  child: CategoryItem(
                      category: categoryList[index],
                      index: index),
                );
              },
               itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
