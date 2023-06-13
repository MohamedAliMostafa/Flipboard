import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel/NewsModel.dart';
import 'package:news_app/Screens/Artical_Tab/Artical_Tab.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Artical_Tab.Route_name,arguments: articles);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        margin: const EdgeInsets.all(10),
        elevation: 30,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                articles.author ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                articles.description ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                (articles.publishedAt)?.substring(0, 10) ?? "",
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
