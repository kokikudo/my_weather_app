import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constraints.dart';
import 'weather_brain.dart';
import 'compornents/location_card.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('ADD LOCATION'),
                        ),
                        Expanded(child: SizedBox()),
                        ElevatedButton(
                            onPressed: () {}, child: Icon(Icons.sort)),
                        SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Icon(Icons.sort_by_alpha)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        LocationCard(),
                        LocationCard(),
                        LocationCard(),
                      ],
                    ),
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
///Location Brainにモデルを入れる空のリストを作成
///Location Brainにリストを取得するget関数をかく
///ADDLOCATIONボタンを押すと地名を入れるアラートを出す
///地名を入れた状態でSearchボタンを押すと地名をもとに天気データ取得
///↑の作業中は画面全体をサークルでかぶせ、他の作業ができないようにする
///天気の情報をモデル化し、リストに入れる
///リストをもとにCardを作る
///更新ボタンを押すと地名で再度取得する
///↑の作業中はそのCardのなかだけをサークルで覆う
///ソート機能を実装する
