import 'package:flutter/material.dart';
import 'package:news_app/Models/CateModel/CateModel.dart';

class CateItem extends StatelessWidget {
CateModel cateModel;
int indx;
CateItem(this.cateModel, this.indx);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cateModel.color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),
        bottomRight: Radius.circular(indx%2!=0?20:0),
          bottomLeft: Radius.circular(indx%2==0?20:0),
        )
      ),
      child: Column(
        children: [
          Image.asset(cateModel.image,width: 100,height: 100,),
          Text(cateModel.title,style: const TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),

    );
  }
}
