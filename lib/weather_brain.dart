import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/model.dart';
import 'package:http/http.dart' as http;

const apiKey = 'f9e51e2a1c21397616df28d563c4420b';

class WeatherBrain extends ChangeNotifier {
  final List<WeatherDataModel> _models = [];

  List<WeatherDataModel> get getModels => _models;

  int get getModelsCount => _models.length;

  void addLocation(String locationName) async {
    final newWeatherModel = await createNewModel(locationName);
    try {
      _models.add(newWeatherModel!);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void updateWeatherModel(int index, String locationName) async {
    final newWeatherModel = await createNewModel(locationName);
    try {
      _models[index] = newWeatherModel!;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<WeatherDataModel?> createNewModel(String locationName) async {
    var weatherData = await getData(locationName);
    if (weatherData == null) {
      return null;
    }
    var now = DateTime.now();
    String name = weatherData['name'];
    double temp = weatherData['main']['temp'];
    double feelsLike = weatherData['main']['feels_like'];
    String iconId = weatherData['weather'][0]['icon'];
    String description = weatherData['weather'][0]['description'];

    final weatherModel =
        WeatherDataModel(now, name, temp, iconId, feelsLike, description);

    return weatherModel;
  }

  Future<dynamic> getData(String locationName) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$locationName&units=metric&lang=ja&appid=$apiKey');
    http.Response _response = await http.get(url);
    if (_response.statusCode == 200) {
      var decodedData = jsonDecode(_response.body);
      return decodedData;
    } else {
      print(_response.statusCode);
      return null;
    }
  }

  void deleteModel(int index) {
    _models.removeAt(index);
    notifyListeners();
  }

  bool _isSortedByUpdate = false;

  void sortByUpdate() {
    _models.sort((a, b) {
      bool judge;
      if (_isSortedByUpdate) {
        judge = a.date.isAfter(b.date);
      } else {
        judge = a.date.isBefore(b.date);
      }

      return judge ? 0 : 1;
    });
    notifyListeners();
    _isSortedByUpdate = !_isSortedByUpdate;
  }

  bool _isSortedByLocationName = false;

  void sortByLocationName() {
    _models.sort((a, b) {
      if (_isSortedByLocationName) {
        return a.locationName.toLowerCase().compareTo(b.locationName);
      } else {
        return b.locationName.toLowerCase().compareTo(a.locationName);
      }
    });
    notifyListeners();
    _isSortedByLocationName = !_isSortedByLocationName;
  }
}
