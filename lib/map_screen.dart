import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constraints.dart';
import 'weather_brain.dart';
import 'compornents/location_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _inputText = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherBrain>(
      builder: (_, brain, child) {
        return Scaffold(
          backgroundColor: kcBackground,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'History',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final alert = Alert(
                              context: context,
                              title: 'Search Location',
                              content: TextField(
                                controller: _controller,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.location_city),
                                    hintText: 'location name'),
                              ),
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    'SEARCH',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  onPressed: () {
                                    _inputText = _controller.text;
                                    _controller.clear();
                                    brain.addLocation(_inputText);
                                    Navigator.pop(_);
                                  },
                                  color: kcOrange,
                                ),
                              ]);
                          alert.show();
                        },
                        child: const Text('ADD LOCATION'),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                          onPressed: () => brain.sortByUpdate(),
                          child: const Icon(Icons.sort)),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                          onPressed: () => brain.sortByLocationName(),
                          child: const Icon(Icons.sort_by_alpha)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: brain.getModelsCount,
                        itemBuilder: (context, index) {
                          return LocationCard(
                            weatherDataModel: brain.getModels[index],
                            deleteIndexCallback: brain.deleteModel,
                            updateModelCallback: brain.updateWeatherModel,
                            index: index,
                          );
                        }),
                    // child: ListView(
                    //   children: brain.getModels
                    //       .map((WeatherDataModel model) =>
                    //           LocationCard(weatherDataModel: model))
                    //       .toList(),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

///TODO 明日の作業
///余裕があれば消える時にアニメーションを追加する
///余裕があれば日本語化　Openweatherのlangパラメーターを使う
