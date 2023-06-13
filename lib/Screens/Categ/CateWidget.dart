import 'package:flutter/material.dart';

import '../../Models/CateModel/CateModel.dart';
import 'CateItem.dart';

class CateWidget extends StatefulWidget {
  Function OnCliked;

  CateWidget(this.OnCliked);

  @override
  State<CateWidget> createState() => _CateWidgetState();
}

class _CateWidgetState extends State<CateWidget> {
  @override
  Widget build(BuildContext context) {
    List<CateModel>cateList=CateModel.getCat(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: const Text("Pick Your Category of Interest",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
        const SizedBox(height: 20,),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20,right: 20,),
            child: GridView.builder(
              itemCount: CateModel.getCat(context).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 18,mainAxisSpacing: 18), itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    widget.OnCliked(cateList[index]);
                  },
                  child: CateItem(cateList[index], index));

            },),
          ),
        ),
      ],
    );
  }
}
