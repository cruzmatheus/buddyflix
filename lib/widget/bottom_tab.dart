import 'package:flutter/material.dart';
import '../model/app_tab.dart';
import 'package:meta/meta.dart';

class BottomTab extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  BottomTab({Key key, @required this.activeTab, @required this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              title: Text(
                "Search",
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv, color: Colors.grey),
              title: Text(
                "Coming soon",
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download, color: Colors.grey),
              title: Text(
                "Downloads",
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.grey),
              title: Text(
                "More",
                style: TextStyle(color: Colors.grey),
              ))
        ].toList());
  }
}
