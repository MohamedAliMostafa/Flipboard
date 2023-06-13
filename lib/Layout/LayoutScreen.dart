
import 'package:flutter/material.dart';
import 'package:news_app/Models/CateModel/CateModel.dart';
import 'package:news_app/Models/SourseModel/SourceResponse.dart';
import 'package:news_app/Models/SourseModel/Sources.dart';
import 'package:news_app/Shared/Remote/APi.dart';
import '../Screens/style/TabControllScreen.dart';

class HomeLayout extends StatefulWidget {
  static const String Routename = "laout";
  CateModel? cateModel;


  HomeLayout({this.cateModel});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selected_ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: FutureBuilder<SourceResponse>(
          future: ApiManager.getsources(widget.cateModel!.Cat_ID),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Sources> sou = snapshot.data?.sources ?? [];
            return TabControllScreen(
              sou: sou,
            );
          },
        ),
      ),
    );
  }
}
