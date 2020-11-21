import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stan_setup/src/feature_mvc/dashboard/sample_home.dart';
import 'package:flutter_stan_setup/src/master_mvc/api/repository.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/app_config.dart';
import 'package:flutter_stan_setup/src/master_mvc/helpers/appmodel.dart';
import 'package:flutter_stan_setup/src/master_mvc/utils/locale.dart';
import 'package:scoped_model/scoped_model.dart';



class TabHomeView extends StatefulWidget {
  TabHomeView({this.isProvider=false,this.isProviderVerified=false,this.userName=""}) : super();
  bool isProvider;
  bool isProviderVerified;
  String userName;
  ValueChanged<bool> currentTab;

  @override
  HomeViewState createState() => new HomeViewState();
}

class HomeViewState extends State<TabHomeView> with SingleTickerProviderStateMixin{

  final Repository repository = Repository();

  static TabController controller;
  int lastIndes=-1;



  @override
  void dispose() {
    controller.removeListener(_handleTabSelection);
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = TabController(
        length: 4, vsync: this, initialIndex:0);
    controller.addListener(_handleTabSelection);

    super.initState();

  }

  Widget get bottomNavigationBar {
    return Container(

      width: 150,
      margin: EdgeInsets.only(bottom: 30.0,left: 80.0,right: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor:  AppConfig.tabbar_vilot,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              /*primaryColor: Colors.red,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))*/),
          child: BottomNavigationBar(
            onTap: (index)async{
              setState(() {
                controller.index = index;
                if(lastIndes==controller.index){
                  SampleHomeViewState.handleTabSelection();
                }
                lastIndes=index;

              });

            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.notification_important_outlined), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.integration_instructions_rounded), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.bluetooth), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('')),
            ],
            unselectedItemColor: AppConfig.white,
            selectedItemColor: AppConfig.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  Future<bool> exitApplicationDialog(
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
                          "Are you sure to exit application?",
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  MyLocalizations(AppStateModel.of(context).appLocal).cancel,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  MyLocalizations(AppStateModel.of(context).appLocal).ok,
                ),
                onPressed: ()async {

                  if(Platform.isAndroid){
                    SystemNavigator.pop();
                  }else{
                    exit(0);
                  }


                },
              )
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: (){
        if(controller.index!=0){
          setState(() {
            controller.index=0;
          });
        }else{
          exitApplicationDialog(context);
        }

      },
      child: ScopedModelDescendant<AppStateModel>(
          builder: (context, child, model) => Container(
            color: Colors.white,
            child: Scaffold(
              resizeToAvoidBottomPadding:false,
              body:
              Stack(
                children: <Widget>[

              TabBarView(
              // Add tabs as widgets
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                SampleHomeView(selction:1),
                SampleHomeView(selction:2),
                SampleHomeView(selction:3),
                SampleHomeView(selction:4),
              ],
              // set the controller
              controller: controller,
            ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(child: bottomNavigationBar),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _handleTabSelection() {


    setState(() {});
  }


}


