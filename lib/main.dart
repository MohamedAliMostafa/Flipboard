import 'package:flutter/material.dart';
import 'package:news_app/Layout/LayoutScreen.dart';
import 'package:news_app/Models/CateModel/CateModel.dart';
import 'package:news_app/Screens/Artical_Tab/Artical_Tab.dart';
import 'package:news_app/Screens/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/Screens/Search/SearchScreen.dart';
import 'package:news_app/Screens/SplashScreen/SplashScreen.dart';
import 'package:news_app/StateManagement/Provider/Mypro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => MyPro(),
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  CateModel? cateModel;
  @override
  Widget build(BuildContext context) {
    var p=Provider.of<MyPro>(context);
    // TODO: implement build
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
locale: Locale(p.language),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      initialRoute:Splash.routeName,
      routes: {
        HomeLayout.Routename:(context)=>HomeLayout(),
        HomeScreen.RouteName:(context)=>HomeScreen(),
        Artical_Tab.Route_name:(context)=>Artical_Tab(),
        Splash.routeName:(context)=>Splash(),
        SearchScreen.RouteName:(context)=>SearchScreen()

      },

    );
  }


}