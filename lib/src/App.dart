// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:flutter_stan_setup/src/master_mvc/helpers/appmodel.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/locale.dart';
import 'package:scoped_model/scoped_model.dart';

import 'feature_mvc/dashboard/tab_home_view.dart';
import 'feature_mvc/splash.dart';

class MVCApp extends AppMVC {
  MVCApp({Key key}) : super();

  @override
  Widget build(BuildContext context) {
    //   initialRoute: '/',
    SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
    ]);
    return ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model) => MaterialApp(

            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            localizationsDelegates: [
              const MyLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            color: Colors.white,
            initialRoute: '/',
            routes: {

              '/': (context) => Splash(),
              '/TabHomeView': (context) => TabHomeView(),


            },
            builder: (BuildContext context, Widget child) {
              return Directionality(
                  textDirection: model.direction,
                  child: Builder(
                    builder: (BuildContext context) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: 1.0,
                        ),
                        child: child,
                      );
                    },
                  ));
            }
            ));
  }
}
