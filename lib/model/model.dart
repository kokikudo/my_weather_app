import 'package:flutter/material.dart';

class WeatherDataModel {
  final DateTime date;
  final String locationName;
  final String address;
  final int latitude;
  final int longitude;
  final int height;

  WeatherDataModel(this.date, this.locationName, this.latitude, this.longitude,
      this.height, this.address);
}
