import 'package:flutter/material.dart';
import 'package:hytes_edition/colors/colors.dart';

class CategorySwitcher extends StatefulWidget {
  @override
  _CategorySwitcherState createState() => _CategorySwitcherState();
}

class _CategorySwitcherState extends State<CategorySwitcher> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'iPhones',
      'Androids',
      'MacBooks',
      'Speakers',
      'Laptops'
    ];
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 50,
      child: ListView.builder(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(
                () {
                  selectedIndex = index;
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right :5, left : 5),
              child: Container(
                decoration: BoxDecoration(
                gradient: selectedIndex == index ? redGrad : LinearGradient(colors: [Colors.white, Colors.white]),
                  borderRadius: BorderRadius.circular(10),
                //  color: selectedIndex == index ? red : Colors.white,
                ),
                height: 40,
                width: 100,
                child: Center(
                  child: Text(names[index],
                      style: TextStyle(
                        fontWeight : selectedIndex == index ? FontWeight.bold : FontWeight.w600,
                        fontSize  : selectedIndex == index ? 18 : 16, 
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
