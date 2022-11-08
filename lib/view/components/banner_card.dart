import 'package:boiler_plate/data/local/banner_model.dart';
import 'package:boiler_plate/utils/colors.dart';
import 'package:boiler_plate/utils/themes.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const bannerHightRatio = 12;
Positioned activeBanner(
    BannerModel banner,
    double top,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  // print("Card");
  return Positioned(
    top: screenSize.height / 2.9 + top,
    right: flag == 0
        ? right != 0.0
            ? right
            : null
        : null,
    left: flag == 1
        ? right != 0.0
            ? right
            : null
        : null,
    child: Dismissible(
      key: Key(Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
        //print("here");
        // setState(() {
        //   var i = data.removeLast();

        //   data.insert(0, i);
        // });
      },
      onDismissed: (DismissDirection direction) {
//          _swipeAnimation();

        dismissImg.call(banner);
      },
      child: Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: Card(
            color: Colors.transparent,
            elevation: 4.0,
            child: Container(
              alignment: Alignment.center,
              width: screenSize.width / 1.2 + cardWidth,
              height: screenSize.height / bannerHightRatio,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenSize.width / 1.2 + cardWidth,
                    height: screenSize.height / bannerHightRatio,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      image: DecorationImage(
                        image: AssetImage(banner.backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListTile(
                      title: Text(banner.title,
                          style: AppThemes.darkTheme.textTheme.bodyMedium
                              ?.copyWith(
                                  color: kWhite, fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        banner.subtitle,
                        style: AppThemes.darkTheme.textTheme.bodySmall
                            ?.copyWith(
                                color: kWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Positioned backgroundBanner(
    BannerModel banner,
    double top,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  // Size screenSize=(500.0,200.0);
  // print("dummyCard");
  return Positioned(
    top: screenSize.height / 2.9 + top,
    // right: flag == 0 ? right != 0.0 ? right : null : null,
    //left: flag == 1 ? right != 0.0 ? right : null : null,
    child: Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.2 + cardWidth,
        height: screenSize.height / bannerHightRatio,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: screenSize.width / 1.2 + cardWidth,
              height: screenSize.height / bannerHightRatio,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                image: DecorationImage(
                  image: AssetImage(banner.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListTile(
                title: Text(banner.title,
                    style: AppThemes.darkTheme.textTheme.bodyMedium
                        ?.copyWith(color: kWhite, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  banner.subtitle,
                  style: AppThemes.darkTheme.textTheme.bodySmall
                      ?.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
