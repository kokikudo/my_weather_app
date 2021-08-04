class WeatherDataModel {
  final DateTime date;
  final String locationName;
  final double temperature;
  final String iconId;
  final double feelsLike;
  final String condition;

  WeatherDataModel(this.date, this.locationName, this.temperature, this.iconId,
      this.feelsLike, this.condition);

  String get iconImageURL {
    return 'http://openweathermap.org/img/wn/$iconId@2x.png';
  }

  String get temperatureGapText {
    double temperatureGap = feelsLike - temperature;
    if (temperatureGap < 0) {
      return temperatureGap.toStringAsFixed(1);
    } else if (temperatureGap > 0) {
      return '+${temperatureGap.toStringAsFixed(1)}';
    } else {
      return temperatureGap.toStringAsFixed(1);
    }
  }
}
