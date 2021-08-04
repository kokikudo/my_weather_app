import 'package:flutter/material.dart';
import 'package:my_weather_app/constraints.dart';
import 'package:my_weather_app/model/model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
    required this.weatherDataModel,
    required this.deleteIndexCallback,
    required this.index,
    required this.updateModelCallback,
  }) : super(key: key);

  final WeatherDataModel weatherDataModel;
  final Function deleteIndexCallback;
  final Function updateModelCallback;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  '${weatherDataModel.date}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                IconButton(
                    onPressed: () {
                      updateModelCallback(index, weatherDataModel.locationName);
                    },
                    icon: const Icon(Icons.refresh)),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () => deleteIndexCallback(index),
                    icon: const Icon(
                      Icons.clear,
                      color: kcDisableIcon,
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              weatherDataModel.locationName,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            Row(
              children: [
                const Icon(Icons.wb_sunny),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Current weather',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  weatherDataModel.temperature.toStringAsFixed(1),
                  style: _textTheme.headline4,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '℃',
                  style: _textTheme.headline5,
                ),
                const Expanded(child: SizedBox()),
                Image.network(weatherDataModel.iconImageURL),
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Feels like',
                          style: _textTheme.bodyText2,
                        ),
                        Text(
                          weatherDataModel.temperatureGapText,
                          style: _textTheme.bodyText1,
                        )
                      ],
                    ),
                    Text(
                      weatherDataModel.condition,
                      style: _textTheme.bodyText2,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
