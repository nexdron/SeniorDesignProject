import 'package:intl/intl.dart';

String localNewYorkTime(DateTime? dateTime){
  var _formattedDate    = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime.toString(), true);
  var _estDateTime      = _formattedDate.toLocal().toIso8601String();

  return _estDateTime;
}

String getCurrentTime()
{
  DateTime now = DateTime.now();
  String _currentTime = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  return _currentTime;
}