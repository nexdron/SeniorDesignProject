import 'package:covid_tracker/utils/date_time.dart';

class LiveBoroughData{
  static final manhattanLiveData = {
    "CONFIRMED_CASE_RATE": 7595.66,
    "CASE_RATE": 9531.92,
    "HOSPITALIZED_RATE": 1010.25,
    "DEATH_RATE": 282.13,
    "CONFIRMED_CASE_COUNT": 123711,
    "PROBABLE_CASE_COUNT": 31536,
    "CASE_COUNT": 155247,
    "HOSPITALIZED_COUNT": 16454,
    "DEATH_COUNT": 4595,
    'time' : getCurrentTime()
  };

  static final brooklynLiveData = {
    "CONFIRMED_CASE_RATE": 10035.42,
    "CASE_RATE": 12179.8,
    "HOSPITALIZED_RATE": 1373.29,
    "DEATH_RATE": 417.13,
    "CONFIRMED_CASE_COUNT": 256897,
    "PROBABLE_CASE_COUNT": 54894,
    "CASE_COUNT": 311791,
    "HOSPITALIZED_COUNT": 35155,
    "DEATH_COUNT": 10678,
    'time' : getCurrentTime()
  };

  static final bronxLiveData = {
    "CONFIRMED_CASE_RATE": 11495.57,
    "CASE_RATE": 14040.69,
    "HOSPITALIZED_RATE": 1752.71,
    "DEATH_RATE": 470.38,
    "CONFIRMED_CASE_COUNT": 163031,
    "PROBABLE_CASE_COUNT": 36095,
    "CASE_COUNT": 199126,
    "HOSPITALIZED_COUNT": 24857,
    "DEATH_COUNT": 6671,
    'time' : getCurrentTime()
  };

  static final queensLiveData = {
    "CONFIRMED_CASE_RATE": 11019.64,
    "CASE_RATE": 13353.64,
    "HOSPITALIZED_RATE": 1547.04,
    "DEATH_RATE": 448.39,
    "CONFIRMED_CASE_COUNT": 248367,
    "PROBABLE_CASE_COUNT": 52605,
    "CASE_COUNT": 300972,
    "HOSPITALIZED_COUNT": 34868,
    "DEATH_COUNT": 10106,
    'time' : getCurrentTime()
  };

  static final statenIslandLiveData = {
    "CONFIRMED_CASE_RATE": 14729.4,
    "CASE_RATE": 17662.97,
    "HOSPITALIZED_RATE": 1382.36,
    "DEATH_RATE": 398.2,
    "CONFIRMED_CASE_COUNT": 70133,
    "PROBABLE_CASE_COUNT": 13968,
    "CASE_COUNT": 84101,
    "HOSPITALIZED_COUNT": 6582,
    "DEATH_COUNT": 1896,
    'time' : getCurrentTime()
  };
}