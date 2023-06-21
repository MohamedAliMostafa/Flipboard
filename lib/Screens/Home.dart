import 'package:flutter/material.dart';
import 'package:news_app/Layout/LayoutScreen.dart';
import 'package:news_app/Models/CateModel/CateModel.dart';
import 'package:news_app/Screens/Categ/CateWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Screens/Search/SearchScreen.dart';
import 'package:news_app/Screens/Setting_Tab/Setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int se = 0;

  @override
  Widget build(BuildContext context) {
    String appBars = se == 1
        ? AppLocalizations.of(context)!.setting
        : se == 0 && SelectedCate == null
            ? AppLocalizations.of(context)!.news
            : SelectedCate!.title;
    return Scaffold(
        appBar: AppBar(
          title: Text(appBars),
          backgroundColor: Colors.teal,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          actions: [Visibility(
            visible: SelectedCate!=null?true :false,
            child: IconButton(onPressed:() {
              Navigator.pushNamed(context, SearchScreen.RouteName,arguments:SelectedCate );
            }, icon: const Icon(Icons.search)),
          )],
        ),
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.teal,
                  child: const Center(
                      child: Text(
                    "News App !",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      CategorOnClikDrawer(1);
                      selec = 0;
                      Navigator.pop(context);
                    });
                  },
                  leading: const Icon(Icons.list),
                  title: Text(
                    "Categories",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      CategorOnClikDrawer(2);
                      Navigator.pop(context);
                    });
                  },
                  leading: Icon(Icons.settings),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                )
              ],
            )),
        body: selec == 1
            ? SettingTab()
            : SelectedCate == null
                ? CateWidget(CategorOnClik)
                : HomeLayout(cateModel: SelectedCate!));
  }

  CateModel? SelectedCate = null;

  void CategorOnClik(CateModel cateModel) {
    setState(() {
      SelectedCate = cateModel;
    });
  }

  int selec = 0;

  void CategorOnClikDrawer(int selectDraw) {
    setState(() {
      if (selectDraw == 1) {
        SelectedCate = null;
      } else if (selectDraw == 2) {
        selec = 1;
      }
    });
  }
}
