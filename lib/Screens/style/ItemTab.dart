import 'package:flutter/material.dart';
import 'package:news_app/Models/SourseModel/Sources.dart';

class ItemTab extends StatelessWidget {
  Sources sources;
  bool isselected=false;


  ItemTab(this.sources, this.isselected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isselected?Colors.black:Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black)
      ),
      child: Text(
        sources.name!,style: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 13,
        color: isselected?Colors.white:Colors.black,
      ),
      ),
    );
  }
}
