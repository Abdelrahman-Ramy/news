import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/home/news/news_widget.dart';
import 'package:news/home/tabs/tab_item.dart';

import '../../model/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,

              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() { });
              },
              tabs: widget.sourcesList.map((source) => TabItem(
                    isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                    source: source),).toList()
            ),
            NewsWidget(source: widget.sourcesList[selectedIndex])
          ],
        )

    );
  }
}
