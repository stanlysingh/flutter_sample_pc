import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stan_setup/src/feature_mvc/dashboard/tab_home_view.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/app_config.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/string.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/ui_font_sizes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
class Splash extends StatefulWidget {
  Splash():super();
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends StateMVC<Splash> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2), () async {

      await Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (context) =>
              TabHomeView()),
          ModalRoute.withName("/TabHomeView"));

    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomPadding:false,
        /*backgroundColor: Config.blue,*/
        body: Container(
          height: query.size.height,
          width: query.size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.bg_splash_screen), fit: BoxFit.fill)),


          child: Column(
            children: [
              Spacer(),
              Text(
                "Welcome",
                style: TextStyle(
                    color: AppConfig.dark_gray,
                    fontWeight: FontWeight.normal,
                    fontSize: AppUIFontSizes.size18,
                    fontFamily: AppConfig.fontNormal),
              ),
              SizedBox(height: 20.0,),


            ],
          ),


        ));
  }
}
