import 'package:covid_tracker/google/model/analytics_model.dart';
import 'package:covid_tracker/views/home/screen/fragments/analytics/analytics_screen.dart';
import 'package:covid_tracker/views/home/screen/fragments/landing_home_fragment/home_screen.dart';
import 'package:covid_tracker/views/home/screen/fragments/maps/map_screen.dart';
import 'package:covid_tracker/views/home/screen/partials/bottom_navigation.dart';
import 'package:covid_tracker/views/home/screen/partials/questionnarie.dart';
import 'package:flutter/material.dart';

class HomeScreenState extends State<HomeScreen>{
  @override
  void initState(){
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _onSelectedWidgetView = [
    const Screening(),
    const MapScreen(),
    Analytics(getPricePoints())
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _onSelectedWidgetView[_selectedIndex],
      bottomNavigationBar: bottomNavigation(context, _selectedIndex, _onItemTapped),
    );
  }
}