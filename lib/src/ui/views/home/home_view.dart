import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              selectedItemColor: Colors.blue,
              unselectedIconTheme: IconThemeData(color: Colors.black),
              selectedIconTheme: IconThemeData(color: Colors.blue),
              unselectedLabelStyle: TextStyle(color: Colors.black),
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile')
              ],
            ),
            body: model.getViewForIndex(model.currentIndex)),
      ),
    );
  }
}
