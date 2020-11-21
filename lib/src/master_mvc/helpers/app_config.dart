import 'dart:async';
import 'dart:io';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_stan_setup/src/master_mvc/helpers/appmodel.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/locale.dart';
import 'package:url_launcher/url_launcher.dart';


class AppConfig {
  /* static String fontNormal = "Verdana";
  static String fontBold = "VerdanaBold";*/

  static String fontNormal = "Montserrat-Regular";
  static String fontBold = "Montserrat-Bold";
  static String fontMedium = "Montserrat-Medium";
  static String fontLight = "Montserrat-Light";
  static String fontSemiBold = "Montserrat-SemiBold";


  static String latinBold = "NotoIKEALatinBold";
  static String latinBoldItalic = "NotoIKEALatinBoldItalic";
  static String latinRegular = "NotoIKEALatinRegular";
  static String latinBoldArabic = "NotoSansIKEAArabic_LatinBold";


  static String apiSuccess = "success";

  static FontWeight weightBold = FontWeight.bold;
  static FontWeight weightNormal = FontWeight.normal;

  static Color white = Color.fromRGBO(255, 255, 255, 1);
  static Color black = Colors.black;
  static Color blue = Color.fromRGBO(0, 81, 186, 1);
  static Color orange = Color.fromRGBO(255, 183, 80, 1);
  static Color green = Color.fromRGBO(108, 185, 102, 1);
  static Color normalBlue = Color.fromRGBO(0, 80, 198, 1);
  static Color brownGrey = Color.fromRGBO(149, 149, 149, 1);
  static Color timestampColor = Color.fromRGBO(149, 149, 149, 1);
  static Color celebrationTitle = Color.fromRGBO(74, 74, 74, 1);
  static Color searchGray = Color.fromRGBO(245, 245, 245, 1);
  static Color bgGray = Color.fromRGBO(239, 239, 239, 1);
  static Color blackTitle = Color.fromRGBO(17, 17, 17, 1);
  static Color contentBlack = Color.fromRGBO(51, 51, 51, 1);
  static Color greyText = Color.fromRGBO(102, 102, 102, 1);
  static Color skipText = Color.fromRGBO(66, 66, 66, 1);
  static Color dotColor = Color.fromRGBO(151, 151, 151, 0.3);
  static Color dotActive = Color.fromRGBO(74, 144, 226, 1);
  static Color red = Color.fromRGBO(255, 7, 7, 1);
  static Color lightRed = Color.fromRGBO(202, 34, 34, 1);
  //Group Details
  static Color veryLightPink = Color.fromRGBO(223, 223, 223, 1);
  static Color divider = Color.fromRGBO(231, 231, 231, 1);
  static Color badgeYellowColor = Color.fromRGBO(255, 203, 4, 1);
  static Color errorColor = Color.fromRGBO(224, 7, 81, 1);
  static Color hint_grey =  Color.fromRGBO(85,87,90,1);
  static Color unseenNotificationColor = const Color(0xffF4F9FF);
  static Color transparentColor = Colors.transparent;
  static Color timeStampColor = const Color(0xff959595);
  static Color titleColor = const Color(0xff111111);
  static Color activityDetailColor = const Color(0xff666666);
  static Color primaryBlueColor = const Color(0xff0051BA);
  static Color sectionHeaderColor = const Color(0xffF5F5F5);
  static Color disabledColor = Color.fromRGBO(137, 154, 163, 1);
  static Color darkRed = Color.fromRGBO(165, 0, 0, 1);

  static Color border_blue = const Color(0xff419bc7);
  static Color fb_blue = const Color(0xff523ddb);
  static Color insta_blue = const Color(0xff2498eb);
  static Color red_google = const Color(0xffe0313b);
  static Color dark_gray = const Color(0xff505055);
  static Color signin_blue = const Color(0xff00b8bd);
  static Color signin_create_acc = const Color(0xff343269);
  static Color bg_dashboard = const Color(0xffeef2f6);
  static Color light_line_gray =  Color(0xffe3e7eb);
  static Color tabbar_vilot =  Color(0xff005b9a);
  static Color errorRed = Colors.red;

  /*for interface*/
  static String baseUrl = "http";
  static String currentBuild = "DEV";


  static Future<void> launchURL(String url) async {
    try {
      if (url.startsWith("http")) {
        await launch(url);
      } else {
        await launch("https://" + url);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> documentlaunchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> showToastAlert(String msg,Color color,
      BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Text(
                          msg,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              /*  FlatButton(
                child: Text(
                  MyLocalizations(AppStateModel.of(context).appLocal).cancel,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),*/
              FlatButton(
                child: Text(
                  MyLocalizations(AppStateModel.of(context).appLocal).ok,
                ),
                onPressed: ()async {

                  Navigator.pop(context);

                },
              )
            ],
          );
        });
  }


  static void dialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {},
            child: AlertDialog(
              content: Container(
                  child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        text,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }

  static void loadingDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {},
            child: AlertDialog(
              content: Container(
                  child: Row(
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text(
                            text,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }


  static Future<void> showToast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, backgroundColor: color);
  }




  static double getFileSize(String file) {
    File tempFile = File(file.toString());
    var fileSizeInBytes = tempFile.lengthSync();
    var fileSizeInKB = fileSizeInBytes / 1024;
    var fileSizeInMB = fileSizeInKB / 1024;

    return fileSizeInMB;
  }


  static double getVideoFileSize(File tempFile) {
    var fileSizeInBytes = tempFile.lengthSync();
    var fileSizeInKB = fileSizeInBytes / 1024;
    var fileSizeInMB = fileSizeInKB / 1024;

    return fileSizeInMB;
  }

  static void hitUrl(dynamic url) {
//    print("OKK:-> URL:" + url.toString());
//    debugPrint('OKK');
  }

  static void hitPrintToken(dynamic token) {
//    print("OKK:-> TOKEN:" + token.toString( ));
//    debugPrint('OKK');
  }

  static void hitRequest(dynamic request) {
//    print("OKK:-> REQUEST:" + request.toString());
//    debugPrint('OKK');
  }

  static void hitResponse(dynamic response) {
//    print("OKK:-> RESPONSE:" + response.toString());
//    debugPrint('OKK');
  }


}
