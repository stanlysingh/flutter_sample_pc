import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/app_config.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/appmodel.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/sessionmanager.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/string.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/ui_font_sizes.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'child_home.dart';



class SampleHomeView extends StatefulWidget {
  SampleHomeView({this.selction}):super();
  int selction;
  @override
  State<StatefulWidget> createState() {
    return SampleHomeViewState();
  }
}

class SampleHomeViewState extends StateMVC<SampleHomeView> {




  SessionManager sessionManager;
  String getToken;



   static handleTabSelection() {
  /*refresh*/
    AppConfig.showToast("current page refresh", AppConfig.green);
  }
  @override
  void initState() {

    sessionManager =  SessionManager();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomPadding:false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.bg_splash_screen), fit: BoxFit.fill)),

          child: Center(
            child: Column(
              children: [
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push<dynamic>( MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => ChildHomeView(selction:widget.selction
                      ),
                    ));

                  },
                  child: Container(
                    height: 50.0,
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppConfig.signin_blue,
                        border: Border.all(
                          color: AppConfig.signin_blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child:  Center(
                      child: Text(
                        widget.selction.toString(),
                        style: TextStyle(
                            color: AppConfig.white,
                            fontWeight: FontWeight.normal,
                            fontSize: AppUIFontSizes.size16,
                            fontFamily: AppConfig.fontNormal),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),

                Spacer()

              ],
            ),
          ),
        ));
  }
}
