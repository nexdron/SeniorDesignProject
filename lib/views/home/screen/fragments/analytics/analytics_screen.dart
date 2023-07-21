import 'package:covid_tracker/google/model/analytics_model.dart';
import 'package:covid_tracker/views/home/state/analytics_state.dart';
import 'package:flutter/material.dart';

class Analytics extends StatefulWidget{

  final List<PricePoint> points; 

  const Analytics(this.points,{Key? key}) : super(key: key);


  @override
  AnalyticsState createState() => AnalyticsState();
}