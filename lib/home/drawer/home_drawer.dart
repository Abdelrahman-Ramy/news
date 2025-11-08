import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.15
            ),
            color: AppColors.primaryLightColor,
            width: double.infinity,
            child: Text('News App!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(height: 10,),
                  Text('Categories',
                    style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(height: 10,),
                  Text('settings',
                  style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
