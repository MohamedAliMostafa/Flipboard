import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel/NewsModel.dart';
import 'package:news_app/Models/SourseModel/Sources.dart';
import 'package:news_app/Screens/NewsCont/NewContent.dart';
import 'package:news_app/Shared/Remote/APi.dart';

import 'ItemTab.dart';

class TabControllScreen extends StatefulWidget {
  List<Sources> sou;

  TabControllScreen({required this.sou});

  @override
  State<TabControllScreen> createState() => _TabControllScreenState();
}

class _TabControllScreenState extends State<TabControllScreen> {
  int selected_ind = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sou.length,
      child: Column(
        children: [
          TabBar(
              indicatorColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 10),
              onTap: (value) {
                selected_ind = value;
                setState(() {});
              },
              isScrollable: true,
              labelColor: Colors.amber,
              tabs: widget.sou
                  .map((source) => ItemTab(
                      source, selected_ind == widget.sou.indexOf(source)))
                  .toList()),
          NewsContent(widget.sou[selected_ind])
        ],
      ),
    );
  }
}
