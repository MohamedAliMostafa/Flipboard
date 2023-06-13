import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel/NewsModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentArtical extends StatefulWidget {

  @override
  State<ContentArtical> createState() => _ContentArticalState();
}

class _ContentArticalState extends State<ContentArtical> {
  @override
  Widget build(BuildContext context) {
    var ars= ModalRoute.of(context)?.settings.arguments as Articles;
  //  final Uri url2 = Uri.parse(ars.url??"");
   /* _launchURL() async {
      if (await canLaunchUrl(url2)) {
        await launchUrl(url2,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url2';
      }

    }
    */
    return Scaffold(
       resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:  Text("News ${ars.author}"),
          backgroundColor: Colors.teal,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pattern.png"),
                    fit: BoxFit.cover)),
            child:Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(ars.urlToImage ?? ""),
                    const SizedBox(height: 10,),
                    Text(
                      ars.author ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      ars.description ?? "",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      (ars.publishedAt)?.substring(0, 10) ?? "",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: 30),
                      elevation: 18,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              ars.content ?? "",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.black87, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 30,),
                            InkWell(
                              onTap: () =>setState(() {

                              }),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("View Full Article"),
                                  Icon(Icons.play_arrow),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        )

    );




  }
}
