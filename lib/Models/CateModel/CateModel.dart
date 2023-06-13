import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CateModel {
  String Cat_ID;
  String image;
  String title;
  Color color;

  CateModel(
      {required this.Cat_ID, required this.image, required this.title, required this.color});

//  general
  static List<CateModel> getCat(BuildContext context) {
    return
      [
        CateModel(Cat_ID:
            "sports",image: "assets/images/sports.png",title: AppLocalizations.of(context)!.sports,color: const Color(0xffC91C22)),
        CateModel(Cat_ID:
            "technology",image: "assets/images/Politics.png",title: AppLocalizations.of(context)!.techno,color: const Color(0xff003E90)),
        CateModel(Cat_ID:"health",image:"assets/images/health.png",title: AppLocalizations.of(context)!.health,color: const Color(0xffED1E79)),
        CateModel(Cat_ID:"business",image:"assets/images/bussines.png", title:AppLocalizations.of(context)!.bussines,color: const Color(0xffCF7E48)),
        CateModel(
            Cat_ID:"entertainment",image:"assets/images/environment.png",title: AppLocalizations.of(context)!.envir, color:const Color(0xff4882CF)),
        CateModel(Cat_ID:"science",image:"assets/images/science.png", title:AppLocalizations.of(context)!.science, color:const Color(0xffF2D352)),

      ];
  }
}
