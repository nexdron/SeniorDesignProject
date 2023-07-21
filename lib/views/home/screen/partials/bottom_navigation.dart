import 'package:covid_tracker/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNavigation(BuildContext context, int index, _onItemTapped)
{
  return BottomNavigationBar(
        backgroundColor: hexStringToColor('F5F5F5'),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: 'Vaccines',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map_pin_ellipse),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Analytics',
          ),
        ],
        currentIndex: index,
        selectedItemColor: hexStringToColor('FF5A5F'),
        onTap: _onItemTapped,
      );
}