import 'package:covid_tracker/views/home/screen/partials/navigation_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/views/home/screen/fragments/analytics/analytics_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/date_time.dart';

class AnalyticsState extends State<Analytics>
{

final List<ChartData> chartData = [
            ChartData('Manhattan',155247),
            ChartData('Queens', 300972),
            ChartData('Bronx', 199126),
            ChartData('Staten Island', 84101),
            ChartData('Brooklyn', 311791)
        ];

  final Uri _url = Uri.parse('https://www.nyc.gov/site/doh/covid/covid-19-data.page#maps');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      drawer: navigationDrawer(context),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text('Live data of five boroughs'),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 2,
            child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.points.map((e) => FlSpot(e.x, e.y)).toList(),
                      isCurved: false,
                      dotData: FlDotData(show: true)
                    )
                  ]
              )),
          ),
          const Text("Below is the live data of boroughs by case count"),
          SizedBox(
            height: 300,
            width: 600,
            child: SfCircularChart(
                        legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                        series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings: const DataLabelSettings(isVisible : true)
                            )
                        ]
                    )
                ),
          Text("Based on as of date ${getCurrentTime()}"),
          const SizedBox(
            height: 20,
          ),
          const Text("For more information visit below."),
          TextButton(
                    child: const Text("Click here", 
                        style: TextStyle(fontSize: 15, 
                                        decoration: TextDecoration.underline, 
                                        color: Colors.blue),
                    ),
                    onPressed: (){
                        launchInBrowser(_url);
                        },
                    )
        ],
      )
    );
  }

}

class ChartData {
   ChartData(this.x, this.y);
        final String x;
        final double y;
}

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }