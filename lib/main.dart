import 'package:buddyflix/bloc/bloc.dart';
import 'package:buddyflix/page/about_page.dart';
import 'package:buddyflix/page/home_page.dart';
import 'package:buddyflix/page/search_page.dart';
import 'package:buddyflix/widget/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import './model/app_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final homeBloc = HomeBloc();
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: homeBloc,
        child: MaterialApp(
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics)
            ],
            title: 'BuddyFLix',
            theme: new ThemeData(
                primaryColor: Colors.black,
                accentColor: Colors.black,
                brightness: Brightness.dark),
            home: Scaffold(body: MainPage())));
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabBloc _tabBloc;

  @override
  void initState() {
    _tabBloc = new TabBloc();
    super.initState();
  }

  @override
  void dispose() {
    _tabBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _tabBloc,
        builder: (BuildContext context, AppTab activeTab) {
          return BlocProviderTree(
              blocProviders: [
                BlocProvider<TabBloc>(bloc: _tabBloc),
              ],
              child: Scaffold(
                body: _getViewTab(activeTab),
                bottomNavigationBar: BottomTab(
                  activeTab: activeTab,
                  onTabSelected: (tab) =>
                      _tabBloc.dispatch(UpdateEvent(tab: tab)),
                ),
              ));
        });
  }

  Widget _getViewTab(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.home:
        {
          return HomePage();
        }
      case AppTab.search:
        {
          return SearchPage();
        }
      case AppTab.about:
        {
          return AboutPage();
        }
      default:
        {
          return Center(child: Text(activeTab.toString()));
        }
    }
  }
}
