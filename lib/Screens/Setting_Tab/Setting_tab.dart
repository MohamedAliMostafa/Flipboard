import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../StateManagement/Provider/Mypro.dart';
import '../style/DropDown.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyPro>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20, left: 40),
                child: Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            DropDowm(
              item1: AppLocalizations.of(context)!.english,
              item2: AppLocalizations.of(context)!.arabic,
              select: p.language == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              onchange: (val) {
                if (val == AppLocalizations.of(context)!.english) {
                  p.changeLang("en");
                } else {
                  p.changeLang("ar");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
