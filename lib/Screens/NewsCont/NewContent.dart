import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel/NewsModel.dart';
import 'package:news_app/Models/SourseModel/Sources.dart';
import 'package:news_app/Screens/NewsCont/NewsItem/NewsItem.dart';
import 'package:news_app/Shared/Remote/APi.dart';

class NewsContent extends StatelessWidget {
  Sources sources;

  NewsContent(this.sources);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: ApiManager.getNews(sources.id??""),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Center(child: Text(snapshot.error.toString()));
            }
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const CircularProgressIndicator();
            }
          var NewsList=snapshot.data!.articles??[];
          return Expanded(
            child: ListView.builder(
               itemCount: NewsList.length,
                itemBuilder: (context, index) {
                  return NewsItem(NewsList[index]);
                },),
          );

        },);
  }
}
