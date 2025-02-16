import 'package:flutter/material.dart';
import 'package:news_project_ff/home_screen/tabs/tap_item.dart';

import '../../model/SourceResponse.dart';
import '../news/news_widget.dart';


class TabWidget extends StatefulWidget {
  List<Sources> sourcesList ;

  TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index){
                  selectedIndex  = index;
                  setState(() {

                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable:true ,
                tabs: widget.sourcesList.map((source)=>TapItem(
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                  sources: source,

                )).toList())
            ,Expanded(child: NewsWidget(sources: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
