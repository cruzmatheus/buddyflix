import 'package:buddyflix/bloc/bloc.dart';
import 'package:buddyflix/widget/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './model/app_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: homeBloc,
        child: MaterialApp(
            title: 'Startup Name Generator',
            theme: new ThemeData(
                primaryColor: Colors.black,
                accentColor: Colors.black,
                brightness: Brightness.dark),
            home: Scaffold(body: HomePage())));
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
//          print(activeTab);
          return BlocProviderTree(
              blocProviders: [
                BlocProvider<TabBloc>(bloc: _tabBloc),
              ],
              child: Scaffold(
                body: activeTab == AppTab.home
                    ? Center(child: Text("Home"))
                    : Center(child: Text("Other")),
                bottomNavigationBar: BottomTab(
                  activeTab: activeTab,
                  onTabSelected: (tab) =>
                      _tabBloc.dispatch(UpdateEvent(tab: tab)),
                ),
              ));
        });
  }
}
