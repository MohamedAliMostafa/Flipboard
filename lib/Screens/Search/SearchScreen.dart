import 'package:flutter/material.dart';
import 'package:news_app/Models/CateModel/CateModel.dart';
import '../../Models/NewsModel/NewsModel.dart';
import '../../Shared/Remote/APi.dart';
import '../NewsCont/NewsItem/NewsItem.dart';

class SearchScreen extends StatefulWidget {
  static const String RouteName = "se";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchArti;
  var cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments as CateModel;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              controller: cont,
              /*  onSubmitted: (value) {                    this is another solution
                searchArti = value;
                setState(() {

                });
              },
      */ //  this is another solution
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    cont.clear();
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    searchArti = cont.text;
                    setState(() {});
                  },
                ),
                hintText: "Search for Articles",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black87)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black87)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black87)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black87)),
              ),
            ),
          ),
          FutureBuilder<NewsModel>(
            future: ApiManager.getSearchNews(searchArti ?? ""),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              var NewsList = snapshot.data!.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: NewsList.length,
                  itemBuilder: (context, index) {
                    return NewsItem(NewsList[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
