import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/app_config.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/sessionmanager.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/string.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/ui_font_sizes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



class ChildHomeView extends StatefulWidget {
  ChildHomeView({this.selction}):super();
  int selction;
  @override
  State<StatefulWidget> createState() {
    return _ChildHomeViewState();
  }
}

class _ChildHomeViewState extends StateMVC<ChildHomeView> {




  SessionManager sessionManager;
  String getToken;


  @override
  void initState() {


    sessionManager =  SessionManager();



    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomPadding:false,
        /*backgroundColor: Config.blue,*/
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.bg_splash_screen), fit: BoxFit.fill)),


            child: Center(
              child: Text(
                "Child "+widget.selction.toString(),
                style: TextStyle(
                    color: AppConfig.white,
                    fontWeight: FontWeight.normal,
                    fontSize: AppUIFontSizes.size16,
                    fontFamily: AppConfig.fontNormal),
              ),
            ),


          ),
        ));
  }
}
